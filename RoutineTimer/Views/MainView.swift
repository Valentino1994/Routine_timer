//
//  MainView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        VStack {
            Button("Test") {
                let routine = routines.first
                routine?.startDate = Date()
            }
            .opacity(isFirst(routines: routines) ? 1.0: 0.0)
            
            RoutineTitleView(isFirst: isFirst(routines: routines))
            
            RoutineView(isFirst: isFirst(routines: routines))
            
            ExerciseTagView(isFirst: isFirst(routines: routines))
            
            ExerciseListView(isFirst: isFirst(routines: routines))
        }
        .padding(.top, 20)
    }
}

extension MainView {
    
    
    func isFirst(routines: [Routine]) -> Bool {
        let routine = routines.first
        let routineStartDate = routine?.startDate
        
        return routineStartDate == nil
    }
}

#Preview {
    MainView()
}
