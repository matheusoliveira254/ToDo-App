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
    let shared = TaskController.sharedInstance
    var task: Task?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(deleteAllTasks), name: allStepsCompleted, object: nil)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
    
    @objc func deleteAllTasks() {
        guard let task = task else {return}
        TaskController.sharedInstance.deleteTask(taskToBeDeleted: task)
        self.tableView.reloadData()
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let task = task else {return}
            let step = task.steps[indexPath.row]
            StepController.sharedInstance.deleteStep(stepToBeDeleted: step, task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    // Delets the current task once all steps are marked as completed
    func presentAllAsCompleteAlert() {
        let alertController = UIAlertController(title: "All Done!", message: "Wants us to delete this list?", preferredStyle: .alert)
        
        let yesDeleteListAction = UIAlertAction(title: "Yes", style: .default) {_ in
            self.deleteAllTasks()
            self.navigationController?.popViewController(animated: true)
        }
        
        let noDeleteListAction = UIAlertAction(title: "No", style: .cancel)
        alertController.addAction(noDeleteListAction)
        alertController.addAction(yesDeleteListAction)
        present(alertController, animated: true)
    }
    
    //MARK: - IBAction
    @IBAction func addStepButtonTapped(_ sender: UIButton) {
        guard let stepsName = stepsNameTextField.text, let task = task else {return}
        StepController.sharedInstance.createStep(name: stepsName, task: task)
        tableView.reloadData()
    }
    
}//End of class

extension StepsListTableViewController: StepTableViewCellDelegate {
    func stepCheckButtonWasTapped(cell: StepTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        guard let task = task else {return}
        let index = task.steps[indexPath.row]
        StepController.sharedInstance.toggleStepIsChecked(stepToBeToggled: index)
        cell.updateViews(step: index)
        var steps = 0
        for step in task.steps {
            if step.isToggleStep {
                steps += 1
            }
        }
        let allStepsComplete = task.steps.count
        
        if steps == allStepsComplete {
            presentAllAsCompleteAlert()
        }
    }
}
