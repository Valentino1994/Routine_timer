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
            
            NavigationLink(destination: MainView()) {
                ConfirmTextButton(title: "Save")
            }
            .padding()
        }
    }
}

#Preview {
    AddRoutineRestView(input: .constant("hi"), onSave: {print("save here")})
}
