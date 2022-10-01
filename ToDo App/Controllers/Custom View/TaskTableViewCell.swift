//
//  TaskTableViewCell.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var stepsNumberLabel: UILabel!
    @IBOutlet weak var taskCheckButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - IBActions
    @IBAction func taskCheckButtonTapped(_ sender: UIButton) {
    }
}
