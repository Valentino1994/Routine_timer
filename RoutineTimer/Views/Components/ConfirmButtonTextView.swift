//
//  ConfirmButtonTextView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI

struct ConfirmButtonTextView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

#Preview {
    ConfirmButtonTextView(title: "Title")
}
