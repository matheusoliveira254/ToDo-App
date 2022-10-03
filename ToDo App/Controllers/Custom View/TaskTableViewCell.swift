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
    weak var delegate: TaskTableViewCellDelegate?
    
    //MARK: - IBActions
    @IBAction func taskCheckButtonTapped(_ sender: UIButton) {
        delegate?.taskCheckButtonWasTapped(cell: self)
    }
}
