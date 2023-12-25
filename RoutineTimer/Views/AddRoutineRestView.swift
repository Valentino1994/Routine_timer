//
//  AddRoutineRestView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct AddRoutineRestView: View {
    @Binding var selectedSplitId: Int
    @Binding var step: Int
    @Binding var isPopupVisible: Bool
    @State var selectedRestDays: [Int] = []
    
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
                    RestCircleButton(circleId: 0, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 1, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 2, selectedRestDays: $selectedRestDays)
                }
                
                HStack {
                    RestCircleButton(circleId: 3, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 4, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 5, selectedRestDays: $selectedRestDays)
                }
                .padding(.top, 18)
                
                HStack {
                    RestCircleButton(circleId: 6, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 7, selectedRestDays: $selectedRestDays)
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
    AddRoutineRestView(selectedSplitId: .constant(1), step: .constant(1), isPopupVisible: .constant(true))
}
