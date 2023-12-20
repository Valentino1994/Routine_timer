//
//  ExerciseType.swift
//  RoutineTimer
//
//  Created by Geunil Park on 12/20/23.
//

import Foundation
import SwiftData

@Model
class ExerciseType {
    @Attribute(.unique) var exerciseTypeId: UUID
    var exerciseBodyType: String
    var exerciseName: String
    
    init(exerciseTypeId: UUID, exerciseBodyType: String, exerciseName: String) {
        self.exerciseTypeId = exerciseTypeId
        self.exerciseBodyType = exerciseBodyType
        self.exerciseName = exerciseName
    }
}
