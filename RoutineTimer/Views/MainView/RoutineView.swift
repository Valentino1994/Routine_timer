//
//  RoutineView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI

struct RoutineView: View {
    var isFirst: Bool
    var body: some View {
        HStack {
            Image("LeftArrow")
                .resizable()
                .frame(width: 15, height: 30)
                .padding(.horizontal, 10)
                .opacity(isFirst ? 0.0 : 1.0)
            
            Spacer()
            
            if isFirst {
                RoutineBoxFirstComponent()
            } else {
                RoutineBoxComponent()
            }
            
            Spacer()
            
            Image("RightArrow")
                .resizable()
                .frame(width: 15, height: 30)
                .padding(.horizontal, 10)
                .opacity(isFirst ? 0.0 : 1.0)
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    RoutineView(isFirst: false)
}
