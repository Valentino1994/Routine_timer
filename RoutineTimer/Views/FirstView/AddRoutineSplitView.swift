//
//  AddRoutineSplitView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct AddRoutineSplitView: View {
    @State var step = 0
    @Binding var isPopupVisible: Bool
    var isEdit: Bool
    @State var selectedSplitId = -1;
    
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
                        SplitCircleButton(circleId: 0, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 2, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 3, selectedSplitId: $selectedSplitId)
                    }
                    
                    HStack {
                        SplitCircleButton(circleId: 4, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 5, selectedSplitId: $selectedSplitId)
                        Spacer()
                        SplitCircleButton(circleId: 6, selectedSplitId: $selectedSplitId)
                    }
                    .padding(.top, 18)
                }
                .padding(.horizontal, 25)
                
                NavigationLink(
                    destination: 
                        AddRoutineRestView(selectedSplitId: $selectedSplitId,
                                           step: $step,
                                           isPopupVisible: $isPopupVisible,
                                           isEdit: isEdit
                                          )
                ) {
                    ConfirmTextButton(title: "Next")
                }
                .padding(.top, 80)
                .opacity(selectedSplitId != -1 ? 1.0 : 0.0)
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
        .overlay(
            CustomStatusBar(step: $step, type: 0)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -320)
        )
    }
}

#Preview {
    AddRoutineSplitView(isPopupVisible: .constant(true), isEdit: false)
}
