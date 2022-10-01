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
    private var tasks: [Task] = []
    
    //MARK: - Initializers
    init() {
        load()
    }
    
    //MARK: - CRUD
    func createTask() {
        save()
    }
    
    func updateTask() {
        save()
    }
    
    func deleteTask() {
        save()
    }
    
    //MARK: - Persistence
    func save() {
        
    }
    
    func load() {
        
    }
}
