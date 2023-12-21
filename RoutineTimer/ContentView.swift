//
//  ContentView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/19.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var routine: [Routine]

    var body: some View {
        if (routine.count == 0) {
            FirstView()
        } else {
            MainView()
        }
    }
}

#Preview {
    ContentView()
}
