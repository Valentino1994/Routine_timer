//
//  CustomStatusBar.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct CustomStatusBar: View {
    var step: Int
    
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 330, height: 10)
                .background(.white)
                .cornerRadius(30)
                .offset(x: 0, y: 0)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 160, height: 8)
                .background(.black)
                .cornerRadius(30)
                .offset(x: -84, y: 0)
        }
        .frame(width: 330, height: 10)
    }
}

#Preview {
    CustomStatusBar(step: 0)
}
