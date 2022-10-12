//
//  StepTableViewCell.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

protocol StepTableViewCellDelegate: AnyObject {
    func stepCheckButtonWasTapped(cell: StepTableViewCell)
}

class StepTableViewCell: UITableViewCell {
    //MARK: - IBOutles
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var stepCheckButton: UIButton!
    
    //MARK: - Properties
    weak var delegateStep: StepTableViewCellDelegate?
//    var step: Step? {
//        didSet{
//            updateViews(step: step)
//        }
//    }
//    
    //MARK: - Methods
    func updateViews(step: Step) {
        stepNameLabel.text = step.stepName
        let stepCheckImageName = step.isToggleStep ? "checkmark.diamond.fill" : "checkmark.diamond"
        let stepCheckImage = UIImage(systemName: stepCheckImageName)
        stepCheckButton.setImage(stepCheckImage, for: .normal)

    }
    //MARK: - IBActions
    @IBAction func stepCheckButtonTapped(_ sender: UIButton) {
        delegateStep?.stepCheckButtonWasTapped(cell: self)
    }
}
