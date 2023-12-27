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
            if !isFirst {
                Image("LeftArrow")
                    .resizable()
                    .frame(width: 15, height: 30)
                    .padding(.horizontal, 10)
            }
            
            Spacer()
            
            if isFirst {
                RoutineBoxFirstComponent()
            } else {
                RoutineBoxComponent()
            }
            
            Spacer()
            
            if !isFirst {
                Image("RightArrow")
                    .resizable()
                    .frame(width: 15, height: 30)
                    .padding(.horizontal, 10)
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
    }
}

#Preview {
    RoutineView(isFirst: false)
}
