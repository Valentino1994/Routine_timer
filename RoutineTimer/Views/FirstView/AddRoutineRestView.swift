//
//  AddRoutineRestView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/21.
//

import SwiftUI
import SwiftData

struct AddRoutineRestView: View {
    @Binding var selectedSplitId: Int
    @Binding var step: Int
    @Binding var isPopupVisible: Bool
    var isEdit: Bool
    @State var selectedRestDays: [Int] = []
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("When is your")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                    Text("rest day")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                    Text("A rest shouldn't be longer than 3 days")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .padding(.top, 1)
                }
                .padding(.leading, 28)
                Spacer()
            }
            .padding(.top, 50)
            .padding(.bottom, 30)
            
            VStack {
                HStack {
                    RestCircleButton(circleId: 0, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 1, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 2, selectedRestDays: $selectedRestDays)
                }
                
                HStack {
                    RestCircleButton(circleId: 3, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 4, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 5, selectedRestDays: $selectedRestDays)
                }
                .padding(.top, 18)
                
                HStack {
                    RestCircleButton(circleId: 6, selectedRestDays: $selectedRestDays)
                    Spacer()
                    RestCircleButton(circleId: 7, selectedRestDays: $selectedRestDays)
                    Spacer()
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.white.opacity(0))
                }
                .padding(.top, 18)
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                if isEdit {
                    if let lastRoutine = routines.last {
                        EditRoutine(routine: lastRoutine, selectedRestDays: selectedRestDays, selectedSplitId: selectedSplitId)
                    }
                } else {
                    SaveRoutine(selectedRestDays: selectedRestDays, selectedSplitId: selectedSplitId)
                }
                isPopupVisible = false
            }) {
                ConfirmTextButton(title: "Confirm")
            }
            .padding(.top, 60)
        }
        .onAppear() {
            step = 1
        }
        .onDisappear {
            step = 0
        }
    }
}

extension AddRoutineRestView {
    func SaveRoutine(selectedRestDays: [Int], selectedSplitId: Int) {
        // Generate Routine
        let routineId = UUID()
        let restDaysString = selectedRestDays.map { String($0) }.joined(separator: " ")
        let routine = Routine(routineId: routineId, split: selectedSplitId, restDays: restDaysString, createdAt: Date(), updatedAt: Date())
        
        // Generate Splits
        var splits: [Split] = []
        if (selectedSplitId == 0) {
            let split = Split(splitId: UUID(), routineId: routineId, isDone: false, createdAt: Date(), updatedAt: Date())
            splits.append(split)
        } else {
            for _ in 0..<selectedSplitId {
                let split = Split(splitId: UUID(), routineId: routineId, isDone: false, createdAt: Date(), updatedAt: Date())
                splits.append(split)
            }
        }
        
        // Save splits
        for split in splits {
            modelContext.insert(split)
        }
        
        // Insert splits to routine
        routine.splits = splits
        modelContext.insert(routine)
    }
    
    func EditRoutine(routine: Routine, selectedRestDays: [Int], selectedSplitId: Int) {
        routine.split = selectedSplitId
        let restDaysString = selectedRestDays.map { String($0) }.joined(separator: " ")
        routine.restDays = restDaysString
        routine.updatedAt = Date()
        
        if let splits = routine.splits {
            for split in splits {
                split.exercises = []
                split.updatedAt = Date()
            }
        }
    }
}

#Preview {
    AddRoutineRestView(selectedSplitId: .constant(1), step: .constant(1), isPopupVisible: .constant(true), isEdit: false)
}
