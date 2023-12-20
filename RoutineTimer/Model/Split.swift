//
//  Split.swift
//  RoutineTimer
//
//  Created by Geunil Park on 12/20/23.
//

import Foundation
import SwiftData

@Model
final class Split {
    @Attribute(.unique, originalName: "split_id") var splitId: UUID
    @Attribute(originalName: "routine_id") var routineId: UUID
    @Attribute(originalName: "is_done") var isDone: Bool
    var order: Int
    @Attribute(originalName: "created_at") var createdAt: Date
    @Attribute(originalName: "updated_at") var updatedAt: Date
    
    var exercises: [Exercise]? = []
    
    init(splitId: UUID, routineId: UUID, isDone: Bool, order: Int, createdAt: Date, updatedAt: Date) {
        self.splitId = splitId
        self.routineId = routineId
        self.isDone = isDone
        self.order = order
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
