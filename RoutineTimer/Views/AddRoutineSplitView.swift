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
    var onNext: () -> Void
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
                        CircleButton(split: 0, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(split: 1, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(split: 2, selectedCircleId: $selectedCircleId)
                    }
                    
                    HStack {
                        CircleButton(split: 3, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(split: 4, selectedCircleId: $selectedCircleId)
                        Spacer()
                        CircleButton(split: 5, selectedCircleId: $selectedCircleId)
                    }
                    .padding(.top, 18)
                }
                .padding(.horizontal, 25)

                NavigationLink(destination: AddRoutineRestView(input: $input, onSave: { print("save") })) {
                    ConfirmTextButton(title: "Next")
                }
                .padding(.top, 80)
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
        .overlay(
            CustomStatusBar(step: step)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -320)
        )
    }
}

#Preview {
    AddRoutineSplitView(onNext: {print("save here")})
}
