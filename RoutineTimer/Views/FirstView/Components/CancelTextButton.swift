//
//  CancelTextButton.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/27.
//

import SwiftUI

struct CancelTextButton: View {
    var title: String
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 340, height: 55)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 1.5)
                    .stroke(.white, lineWidth: 3)
            )
            .overlay(
                Text(title)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 340, height: 55)
                    .contentShape(Rectangle())
            )
    }
}

#Preview {
    CancelTextButton(title: "hi")
}
