//
//  TaskListTableViewController.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import UIKit

let allStepsCompleted = NSNotification.Name("Mark all as complete.")

class TaskListTableViewController: UITableViewController {
        
    //MARK: - IBOutlet
    @IBOutlet weak var taskNameTextField: UITextField!
    
    //MARK: - Properties
    let shared = TaskController.sharedInstance
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {return UITableViewCell()}
        let task = shared.tasks[indexPath.row]
        cell.updateViews(task: task)
        cell.delegateTask = self
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = shared.tasks[indexPath.row]
            shared.deleteTask(taskToBeDeleted: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
      
        }    
    }
    
    //Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toStepsVc",
              let destinationVC = segue.destination as? StepsListTableViewController,
              let indexPath = tableView.indexPathForSelectedRow else {return}
        
        let taskToSend = shared.tasks[indexPath.row]
        destinationVC.task = taskToSend
    }
    
    //MARK: - IBAction
    @IBAction func createTaskButtonTapped(_ sender: UIButton) {
        guard let taskName = taskNameTextField.text else {return}
        shared.createTask(name: taskName)
        tableView.reloadData()
    }
    
}//End of class

extension TaskListTableViewController: TaskTableViewCellDelegate {
    func taskCheckButtonWasTapped(cell: TaskTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let index = shared.tasks[indexPath.row]
        shared.toggleTaskIsChecked(task: index)
        cell.updateViews(task: index)
    }
}
