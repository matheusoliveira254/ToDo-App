//
//  TaskTableViewCell.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func taskCheckButtonWasTapped(cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var stepsNumberLabel: UILabel!
    @IBOutlet weak var taskCheckButton: UIButton!
    
    //MARK: - Properties
    weak var delegateTask: TaskTableViewCellDelegate?
    var task: Task? {
        didSet {
            guard let unwrappedTask = task else {return}
            updateViews(task: unwrappedTask)
        }
    }
    
    //MARK: - Methods
    func updateViews(task: Task?) {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        stepsNumberLabel.text = "\(task.steps.count)>"
        let checkedImageName = task.isToggleTask ? "checkmark.diamond.fill" : "checkmark.diamond"
        let checkedImage = UIImage(systemName: checkedImageName)
        taskCheckButton.setImage(checkedImage, for: .normal)
    }
    
    //MARK: - IBActions
    @IBAction func taskCheckButtonTapped(_ sender: UIButton) {
        delegateTask?.taskCheckButtonWasTapped(cell: self)
    }
}//End of class
