//
//  StepsController.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/2/22.
//

import Foundation

class StepController {
    //MARK: - CRUD
    func createStep(name: String, task: Task) {
        let stepCreated = Step(stepName: name)
        task.steps.append(stepCreated)
        TaskController.sharedInstance.save()
    }
    
    func deleteStep(stepToBeDeleted: Step, task: Task) {
        guard let indexOfStepToDelete = task.steps.firstIndex(of: stepToBeDeleted) else {return}
        task.steps.remove(at: indexOfStepToDelete)
        TaskController.sharedInstance.save()
        
    }
    
    //MARK: - Methods
    func toggleStepIsChecked() {
    }
}
