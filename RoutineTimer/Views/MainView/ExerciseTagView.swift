//
//  ExerciseTagView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI

struct ExerciseTagView: View {
    var isFirst: Bool
    
    var body: some View {
        HStack {
            HStack {
                Rectangle()
                    .frame(width: 100, height: 40)
                Rectangle()
                    .frame(width: 80, height: 40)
            }
            Spacer()
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 35, height: 35)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 15)
        .opacity(isFirst ? 0.0 : 1.0)
    }
}

#Preview {
    ExerciseTagView(isFirst: false)
}
