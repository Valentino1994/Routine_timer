//
//  CustomStatusBar.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct CustomStatusBar: View {
    @Binding var step: Int
    var type: Int
    
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
                .frame(width: calculateWidth(), height: 8)
                .background(.black)
                .cornerRadius(30)
                .offset(x: calculateOffset(), y: 0)
                .animation(.easeInOut, value: 0.3)
        }
        .frame(width: 330, height: 10)
    }
}

extension CustomStatusBar {
    func calculateWidth() -> CGFloat {
        switch type {
        case 0:
            return 160
        default:
            return 110
        }
    }
    func calculateOffset() -> CGFloat {
        switch step {
        case 0:
            return -84
        case 1:
            return 84
        case 2:
            return -109
        case 3:
            return 2
        default:
            return 109
        }
    }
}

#Preview {
    CustomStatusBar(step: .constant(0), type: 0)
}
