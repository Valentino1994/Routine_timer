//
//  ExerciseTagView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI

struct ExerciseTagView: View {
    var isFirst: Bool
    @Binding var isAddExerciseViewVisible: Bool
    
    var body: some View {
        HStack {
            HStack {
                Rectangle()
                    .frame(width: 100, height: 40)
                Rectangle()
                    .frame(width: 80, height: 40)
            }
            
            Spacer()
            
            Button(action: {
                isAddExerciseViewVisible.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .accentColor(.white)
            }
        }
        .padding(.horizontal, 20)
        .opacity(isFirst ? 0.0 : 1.0)
    }
}
