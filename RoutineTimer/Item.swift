//
//  Item.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/19.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
