//
//  UnselectedCircle.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct CircleButton: View {
    var circleId: Int
    var isSplit: Bool
    @Binding var selectedCircleId: Int
    
    var body: some View {
        ZStack() {
            if (selectedCircleId != circleId) {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        Text(isSplit ? String(circleId): restDays[circleId])
                            .font(Font.custom(
                                "SF Pro Text",
                                size: checkCircleText(isSplit: isSplit, circleId: circleId)
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
                        Text(isSplit ? String(circleId): restDays[circleId])
                            .font(Font.custom(
                                "SF Pro Text",
                                size: checkCircleText(isSplit: isSplit, circleId: circleId)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
            }
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            selectedCircleId = circleId
        }
    }
    
    let restDays: [String] = [
        "Every\nOther",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat",
        "Sun"
    ]
}

extension CircleButton {
    func checkCircleText(isSplit: Bool, circleId: Int) -> CGFloat {
        if isSplit {
            return 30
        } else {
            if circleId == 0 {
                return 20
            } else {
                return 25
            }
        }
    }
}
