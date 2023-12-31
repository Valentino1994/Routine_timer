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
    @State var isAddExerciseViewVisible: Bool = false
    
    var body: some View {
        VStack {
            RoutineTitleView(isFirst: isFirst(routines: routines))
            
            RoutineView(isFirst: isFirst(routines: routines))
            
            ExerciseTagView(isFirst: isFirst(routines: routines), isAddExerciseViewVisible: $isAddExerciseViewVisible)
            
            Spacer()
            
            ExerciseListView(isFirst: isFirst(routines: routines))
            
            Spacer()
        }
        .padding(.top, 20)
        .fullScreenCover(isPresented: $isAddExerciseViewVisible) {
            AddExerciseView(isAddExerciseViewVisible: $isAddExerciseViewVisible)
        }
    }
}

extension MainView {
    func isFirst(routines: [Routine]) -> Bool {
        let routine = routines.last
        let routineStartDate = routine?.startDate
        
        return routineStartDate == nil
    }
}

#Preview {
    MainView()
}
