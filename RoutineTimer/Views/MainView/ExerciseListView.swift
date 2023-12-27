//
//  ExerciseListView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var isFirst: Bool
    
    var body: some View {
        if !isFirst {
            List {
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
                Rectangle()
                    .frame(width: 350, height: 125)
            }
        }
    }
}

#Preview {
    ExerciseListView(isFirst: false)
}
