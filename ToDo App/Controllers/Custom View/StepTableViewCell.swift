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
    weak var delegate: StepTableViewCellDelegate?
    
    //MARK: - IBActions
    @IBAction func stepCheckButtonTapped(_ sender: UIButton) {
        delegate?.stepCheckButtonWasTapped(cell: self)
    }
}
