//
//  CustomStatusBar.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct CustomStatusBar: View {
    @Binding var step: Int
    
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
                .offset(x: calculateOffset(), y: 0)
                .animation(.easeInOut(duration: 0.5)) 
        }
        .frame(width: 330, height: 10)
    }
}

extension CustomStatusBar {
    func calculateOffset() -> CGFloat {
        switch step {
        case 0:
            return -84
        default:
            return 84
        }
    }
}

#Preview {
    CustomStatusBar(step: .constant(0))
}
