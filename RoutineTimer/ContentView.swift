//
//  ContentView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/19.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        Text("HI")
    }
}

#Preview {
    ContentView()
}
