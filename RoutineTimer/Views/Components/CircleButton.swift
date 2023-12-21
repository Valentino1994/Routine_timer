//
//  UnselectedCircle.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct CircleButton: View {
    var split: Int
    @Binding var selectedCircleId: Int
    
    var body: some View {
        ZStack() {
            if (selectedCircleId != split) {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        Text(String(split))
                            .font(Font.custom("SF Pro Text", size: 35).weight(.semibold))
                            .lineSpacing(21)
                            .foregroundColor(.white)
                    )
            } else {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [6]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(red: 0.65, green: 0.80, blue: 0.28))
                    .padding()
                    .overlay(
                        Text(String(split))
                            .font(Font.custom("SF Pro Text", size: 35).weight(.semibold))
                            .lineSpacing(21)
                            .foregroundColor(.white)
                    )
            }
            
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            selectedCircleId = split
        }
    }
}
