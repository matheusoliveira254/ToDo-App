//
//  StepTableViewCell.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

class StepTableViewCell: UITableViewCell {
    //MARK: - IBOutles
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var stepCheckButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //MARK: - IBActions
    @IBAction func stepCheckButtonTapped(_ sender: UIButton) {
    }
}
