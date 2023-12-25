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
    var routines: [Routine]
    
    var body: some View {
        List {
            ForEach(routines.last?.splits ?? [], id: \.self) { split in
                Text(split.splitId.uuidString)
            }
        }
    }
}

#Preview {
    MainView()
}
