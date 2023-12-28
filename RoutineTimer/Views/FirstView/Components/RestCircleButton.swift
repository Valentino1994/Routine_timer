//
//  RestCircleButton.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/25.
//

import SwiftUI

struct RestCircleButton: View {
    var circleId: Int
    @Binding var selectedRestDays: [Int]
    
    let restDays: [String] = [
        "Every\nOther",
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat",
    ]
    
    var body: some View {
        ZStack() {
            if (!selectedRestDays.contains(circleId)) {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        Text(restDays[circleId])
                            .font(Font.custom(
                                "SF Pro Text",
                                size: (circleId == 0 ? 20 : 30)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
            } else {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [6]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(red: 0.65, green: 0.80, blue: 0.28))
                    .padding()
                    .overlay(
                        Text(restDays[circleId])
                            .font(Font.custom(
                                "SF Pro Text",
                                size: (circleId == 0 ? 20 : 30)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
            }
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            if circleId == 0 {
                selectedRestDays = [0]
            } else {
                if selectedRestDays.contains(circleId) {
                    selectedRestDays.removeAll { $0 == circleId }
                } else {
                    selectedRestDays.append(circleId)
                }
                
                if selectedRestDays.count >= 4  {
                    selectedRestDays.removeFirst()
                } else {
                    selectedRestDays.removeAll { $0 == 0 }
                }
            }
        }
    }
}

#Preview {
    RestCircleButton(circleId: 1, selectedRestDays: .constant([1]))
}
