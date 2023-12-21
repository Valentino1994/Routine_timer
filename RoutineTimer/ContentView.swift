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
    @State private var isPopupVisible = false
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem { Label(
                    title: { Text("Main") },
                    icon: { Image(systemName: "42.circle") }
                )}
                .tag(0)
            
            StatisticsView()
                .tabItem { Label(
                    title: { Text("Statistics") },
                    icon: { Image(systemName: "42.circle") }
                )}
                .tag(1)
            
            SettingsView()
                .tabItem { Label(
                    title: { Text("Settings") },
                    icon: { Image(systemName: "42.circle") }
                )}
                .tag(2)
        }
        .onAppear {
            if (routine.count == 0) {
                isPopupVisible.toggle()
            }
        }
        .fullScreenCover(isPresented: $isPopupVisible) {
            FirstView(isPopupVisible: $isPopupVisible)
        }
    }
}

#Preview {
    ContentView()
}
