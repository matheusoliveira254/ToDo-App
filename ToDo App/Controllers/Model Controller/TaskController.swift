//
//  TaskController.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import Foundation

class TaskController {
    //MARK: - Singleton
    static var sharedInstance = TaskController()
    
    //MARK: - SOT
    private(set) var tasks: [Task] = []
    
    //MARK: - Initializers
    init() {
        load()
    }
    
    //MARK: - CRUD
    func createTask(name: String, steps: [Step] = []) {
        let taskCreate = Task(name: name, steps: steps)
        tasks.append(taskCreate)
        save()
    }
    
    func deleteTask(taskToBeDeleted: Task) {
        guard let indesOfTaskToBeDeleted = tasks.firstIndex(of: taskToBeDeleted) else {return}
        tasks.remove(at: indesOfTaskToBeDeleted)
        save()
    }
    
    //MARK: - Methods
    func toggleTaskIsChecked(task: Task) {
        task.isToggleTask.toggle()
        save()
    }
    
    //MARK: - Persistence
    //Computed Property
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalUrl = documentsDirectory.appendingPathComponent("tasks.json")
        return finalUrl
    }
    
    func save() {
        guard let url = fileURL else {return}
        
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: url)
        } catch let error {
            print("Error \(error)")
        }
    }
    
    func load() {
        guard let loadLocation = fileURL else {return}
        
        do {
            let data = try Data(contentsOf: loadLocation)
            let decodeData = try JSONDecoder().decode([Task].self, from: data)
            self.tasks = decodeData
        } catch let error {
            print("Error \(error)")
        }
    }
}
