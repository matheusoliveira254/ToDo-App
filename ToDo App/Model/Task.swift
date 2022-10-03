//
//  Task.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/1/22.
//

import Foundation

class Task: Codable {
    
    let id: UUID
    var name: String
    var steps: [Step]
    var isToggleTask: Bool
    
    init(id: UUID = UUID(), name: String, steps: [Step] = [], isToggleTask: Bool = false) {
        self.id = id
        self.name = name
        self.steps = steps
        self.isToggleTask = isToggleTask
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
