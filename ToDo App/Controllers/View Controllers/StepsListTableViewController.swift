//
//  StepsListTableViewController.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

class StepsListTableViewController: UITableViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var stepsNameTextField: UITextField!
    
    //MARK: - Properties
//    let shared = TaskController.sharedInstance
    var task: Task?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return task?.steps.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as? StepTableViewCell, let task = task else {return UITableViewCell()}
        let step = task.steps[indexPath.row]
        cell.updateViews(step: step)
        cell.delegateStep = self
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    //MARK: - IBAction
    @IBAction func addStepButtonTapped(_ sender: UIButton) {
        guard let stepsName = stepsNameTextField.text, let task = task else {return}
        StepController.sharedInstance.createStep(name: stepsName, task: task)
        tableView.reloadData()
    }
}

extension StepsListTableViewController: StepTableViewCellDelegate {
    func stepCheckButtonWasTapped(cell: StepTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        guard let task = task else {return}
        let index = task.steps[indexPath.row]
        StepController.sharedInstance.toggleStepIsChecked(stepToBeToggled: index)
        cell.updateViews(step: index)
    }
}
