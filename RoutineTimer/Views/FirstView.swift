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
                        Text("Timer")
                    }
                    Spacer()
                }
                
                Image("FirstViewImage")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Make your workout")
                        Text("most efficiently")
                    }
                    Spacer()
                }
                
                NavigationLink(destination: StatisticsView()) {
                    ConfirmButtonTextView(title: "Start")
                }
            }
        }
    }
}

#Preview {
    FirstView(isPopupVisible: .constant(true))
}
