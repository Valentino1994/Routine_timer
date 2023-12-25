//
//  FirstView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct FirstView: View {
    @Binding var isPopupVisible: Bool
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Routine")
                            .font(.system(size: 55, weight: .semibold, design: .default))
                        Text("Timer")
                            .font(.system(size: 55, weight: .semibold, design: .default))
                    }
                    .padding(.leading, 28)
                    Spacer()
                }
                
                Image("FirstViewImage")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 30)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Make your workout")
                            .font(.system(size: 30, weight: .semibold, design: .default))
                        Text("most efficiently")
                            .font(.system(size: 30, weight: .semibold, design: .default))
                    }
                    .padding(.leading, 28)
                    .padding(.bottom, 30)
                    
                    Spacer()
                }
                
                NavigationLink(destination: AddRoutineSplitView(isPopupVisible: $isPopupVisible)) {
                    ConfirmTextButton(title: "Start")
                }
            }
        }
    }
}

#Preview {
    FirstView(isPopupVisible: .constant(true))
}
