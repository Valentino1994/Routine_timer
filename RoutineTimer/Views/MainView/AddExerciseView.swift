//
//  AddExerciseView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/28.
//

import SwiftUI

struct AddExerciseView: View {
    @Binding var isAddExerciseViewVisible: Bool
    @State var step: Int = 2;
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isAddExerciseViewVisible.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .accentColor(.white)
                }
            }
            .navigationBarTitle("Add Exercise", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isAddExerciseViewVisible.toggle()
            })
        }
        .overlay(
            CustomStatusBar(step: $step, type: 1)
                .edgesIgnoringSafeArea(.top)
                .offset(y: -320)
        )
        
    }
}
