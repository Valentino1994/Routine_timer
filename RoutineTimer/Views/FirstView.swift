//
//  FirstView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Routine")
                Text("Timer")
            }
            Image("FirstViewImage")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    FirstView()
}
