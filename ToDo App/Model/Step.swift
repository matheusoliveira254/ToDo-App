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
    var isToggleStep: Bool
    
    init(stepId: UUID = UUID(), stepName: String, isToggleStep: Bool = false) {
        self.stepId = stepId
        self.stepName = stepName
        self.isToggleStep = isToggleStep
    }
}

extension Step: Equatable {
    static func == (lhs: Step, rhs: Step) -> Bool {
        return lhs.stepId == rhs.stepId
    }
}
