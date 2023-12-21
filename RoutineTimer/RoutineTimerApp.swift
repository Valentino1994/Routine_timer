//
//  RoutineTimerApp.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/19.
//

import SwiftUI
import SwiftData

@main
struct RoutineTimerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Routine.self, Split.self, Exercise.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
