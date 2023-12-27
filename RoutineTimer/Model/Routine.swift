//
//  Routine.swift
//  RoutineTimer
//
//  Created by Geunil Park on 12/20/23.
//

import Foundation
import SwiftData

@Model
final class Routine {
    @Attribute(.unique, originalName: "routine_id") var routineId: UUID
    var split: Int
    @Attribute(originalName: "rest_days") var restDays: String
    @Attribute(originalName: "start_date") var startDate: Date?
    @Attribute(originalName: "end_date") var endDate: Date?
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
    var splits: [Split]? = [Split]()
    
    init(routineId: UUID, split: Int, restDays: String, createdAt: Date, updatedAt: Date) {
        self.routineId = routineId
        self.split = split
        self.restDays = restDays
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
