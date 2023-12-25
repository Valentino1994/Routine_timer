//
//  AddRoutineSplitView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct AddRoutineSplitView: View {
    @State var step = 0
    @State var input = ""
    @Binding var isPopupVisible: Bool
    @State var selectedCircleId = -1;
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("How many")
                            .font(.system(size: 32, weight: .semibold, design: .default))
                        Text("split workouts")
                            .font(.system(size: 32, weight: .semibold, design: .default))
                    }
                    .padding(.leading, 28)
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        CircleButton(circleId: 0, isSplit: true, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(circleId: 2, isSplit: true, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(circleId: 3, isSplit: true, selectedCircleId: $selectedCircleId)
                    }
                    
                    HStack {
                        CircleButton(circleId: 4, isSplit: true, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(circleId: 5, isSplit: true, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(circleId: 6, isSplit: true, selectedCircleId: $selectedCircleId)
                    }
                    .padding(.top, 18)
                }
                .padding(.horizontal, 25)
                
                NavigationLink(destination: AddRoutineRestView(input: $input, step: $step, isPopupVisible: $isPopupVisible)) {
                    ConfirmTextButton(title: "Next")
                }
                .padding(.top, 80)
                .opacity(selectedCircleId != -1 ? 1.0 : 0.0)
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
        .overlay(
            CustomStatusBar(step: $step)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -320)
        )
    }
}

#Preview {
    AddRoutineSplitView(isPopupVisible: .constant(true))
}
