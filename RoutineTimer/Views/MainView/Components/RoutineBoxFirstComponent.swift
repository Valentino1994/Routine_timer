//
//  RoutineFirstComponent.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI
import SwiftData

struct RoutineBoxFirstComponent: View {
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    let restDays: [String] = [
        "Every\nOther",
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat"
    ]
    
    @State private var isPopupVisible = false
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("My Split")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                }
                Spacer()
            }
            
            HStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .overlay(
                        Text(String(routines.last?.split ?? 0))
                            .font(Font.custom(
                                "SF Pro Text",
                                size: (30)
                            ).weight(.semibold))
                            .foregroundColor(.white)
                    )
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("My Rest day")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                }
                Spacer()
            }
            .padding(.top, 20)
            
            HStack() {
                ForEach(makeRestArray(restDaysString: routines.last?.restDays ?? ""), id: \.self) { number in
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .overlay(
                            Text(restDays[number])
                                .font(Font.custom("SF Pro Text", size: 30).weight(.semibold))
                                .foregroundColor(.white)
                        )
                }
                Spacer()
            }
            .padding(.bottom, 40)
            
            Button(action: {
                isPopupVisible.toggle()
            }) {
                CancelTextButton(title: "Edit")
            }
            
            Button(action: {
                startRoutine(startDate: Date())
            }) {
                ConfirmTextButton(title: "Start Routine")
            }
            .padding(.top, 10)
        }
        .fullScreenCover(isPresented: $isPopupVisible) {
            AddRoutineSplitView(isPopupVisible: $isPopupVisible, isEdit: true)
        }
    }
}

extension RoutineBoxFirstComponent {
    func makeRestArray(restDaysString: String) -> [Int] {
        let stringArray = restDaysString.components(separatedBy: " ")
        let intArray = stringArray.compactMap { Int($0) }.sorted()
        return intArray
    }
    
    func startRoutine(startDate: Date) {
        if let routine = routines.last {
            if let splits = routine.splits {
                var splitDays: Int = 0
                var workoutDay: Date = startDate
                let restDaysArray = routine.restDays.components(separatedBy: " ").map({ Int($0) })
                let calendar = Calendar.current
                
                if (restDaysArray.first == 0) {
                    var isRestDay: Bool = false
                    while splitDays < splits.count + 1 {
                        if (!isRestDay) {
                            if (splitDays < splits.count) {
                                splits[splitDays].splitDate = workoutDay
                            }
                            splitDays += 1
                        }
                        
                        if splitDays == splits.count + 1 {
                            break
                        }
                        
                        if let nextWorkoutDay = Calendar.current.date(byAdding: .day, value: 1, to: workoutDay) {
                            workoutDay = nextWorkoutDay
                        }
                        
                        isRestDay.toggle()
                    }
                } else {
                    while splitDays < splits.count + 1 {
                        let components = calendar.dateComponents([.weekday], from: workoutDay)
                        let weekDay = components.weekday
                        if (!restDaysArray.contains(weekDay)) {
                            if (splitDays < splits.count) {
                                splits[splitDays].splitDate = workoutDay
                            }
                            splitDays += 1
                        }
                        
                        if splitDays == splits.count + 1 {
                            break
                        }
                        
                        if let nextWorkoutDay = Calendar.current.date(byAdding: .day, value: 1, to: workoutDay) {
                            workoutDay = nextWorkoutDay
                        }
                    }
                }
                
                routine.startDate = startDate
                routine.nextDate = workoutDay
            }
        }
    }
}

#Preview {
    RoutineBoxFirstComponent()
}
