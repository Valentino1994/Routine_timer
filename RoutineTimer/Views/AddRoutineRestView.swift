//
//  AddRoutineRestView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct AddRoutineRestView: View {
    @Binding var input: String
    @Binding var step: Int
    @Binding var isPopupVisible: Bool
    @State var selectedCircleId = -1;
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("When is your")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                    Text("rest day")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                }
                .padding(.leading, 28)
                Spacer()
            }
            .padding(.top, 50)
            .padding(.bottom, 40)
            
            VStack {
                HStack {
                    CircleButton(circleId: 0, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    CircleButton(circleId: 1, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    CircleButton(circleId: 2, isSplit: false, selectedCircleId: $selectedCircleId)
                }
                
                HStack {
                    CircleButton(circleId: 3, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    CircleButton(circleId: 4, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    CircleButton(circleId: 5, isSplit: false, selectedCircleId: $selectedCircleId)
                }
                .padding(.top, 18)
                
                HStack {
                    CircleButton(circleId: 6, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    CircleButton(circleId: 7, isSplit: false, selectedCircleId: $selectedCircleId)
                    Spacer()
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.white.opacity(0))
                }
                .padding(.top, 18)
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                isPopupVisible = false
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding(.top, 60)
        }
        .onAppear() {
            step = 1
        }
        .onDisappear {
            step = 0
        }
    }
}

#Preview {
    AddRoutineRestView(input: .constant("hi"), step: .constant(1), isPopupVisible: .constant(true))
}
