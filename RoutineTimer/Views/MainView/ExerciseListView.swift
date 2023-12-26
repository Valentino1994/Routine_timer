//
//  ExerciseListView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI

struct ExerciseListView: View {
    var isFirst: Bool
    
    var body: some View {
        VStack {
            Rectangle()
            Rectangle()
            Rectangle()
            Rectangle()
            Rectangle()
            Rectangle()
            Rectangle()
            Rectangle()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ExerciseListView(isFirst: false)
}
