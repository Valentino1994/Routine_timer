//
//  AddRoutineRestView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct AddRoutineRestView: View {
    @Binding var input: String
    var onSave: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("When is your")
                        .font(.system(size: 28, weight: .semibold, design: .default))
                    Text("rest day")
                        .font(.system(size: 28, weight: .semibold, design: .default))
                }
                .padding(.leading, 28)
                Spacer()
            }
            .padding(.top, 50)
            .padding(.bottom, 40)
            
            
            NavigationLink(destination: MainView()) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding()
        }
    }
}

#Preview {
    AddRoutineRestView(input: .constant("hi"), onSave: {print("save here")})
}
