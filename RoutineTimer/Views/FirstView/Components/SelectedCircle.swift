//
//  SelectedCircle.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct SelectedCircle: View {
    var body: some View {
        ZStack() {
            Ellipse()
                .foregroundColor(.clear)
                .frame(width: 100, height: 100)
                .overlay(
                    Ellipse()
                        .inset(by: 2.50)
                        .stroke(Color(red: 0.65, green: 0.80, blue: 0.28), lineWidth: 2.50)
                )
            Text("0")
                .font(Font.custom("SF Pro Text", size: 35).weight(.semibold))
                .lineSpacing(21)
                .foregroundColor(.white)
                .offset(x: 0, y: 0.50)
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    SelectedCircle()
}
