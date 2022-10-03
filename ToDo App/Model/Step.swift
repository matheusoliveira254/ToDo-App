//
//  Steps.swift
//  ToDo App
//
//  Created by Matheus Oliveira on 10/2/22.
//

import Foundation

class Step: Codable{
    let stepId: UUID
    var stepName: String
    
    init(stepId: UUID = UUID(), stepName: String) {
        self.stepId = stepId
        self.stepName = stepName
    }
}

extension Step: Equatable {
    static func == (lhs: Step, rhs: Step) -> Bool {
        return lhs.stepId == rhs.stepId
    }
}
