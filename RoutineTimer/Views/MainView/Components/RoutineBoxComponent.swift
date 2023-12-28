//
//  RoutineComponent.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI
import SwiftData

struct RoutineBoxComponent: View {
    @Query(sort: \Routine.createdAt, order: .forward)
    private var routines: [Routine]
    
    var body: some View {
        ForEach(routines.last?.splits?.sorted(by: {$0.splitDate ?? Date() < $1.splitDate ?? Date()}) ?? [], id: \.self) { split in
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .frame(height: 70)
                .foregroundColor(compareWithToday(targetDate: split.splitDate ?? Date()) || split.isDone ? Color(red: 0.65, green: 0.80, blue: 0.28) : Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(red: 0.65, green: 0.80, blue: 0.28))
                        .opacity(split.isDone ? 1.0 : 0.0)
                    )
                .overlay(
                    VStack {
                        Text(dateFormatingForMonth(date: split.splitDate ?? Date()))
                            .font(Font.custom("SF Pro Text", size: 14).weight(.semibold))
                            .foregroundColor(split.isDone ? .black : .white)
                            .padding(.bottom, 1)
                        Text(dateFormatingForDay(date: split.splitDate ?? Date()))
                            .font(Font.custom("SF Pro Text", size: 20).weight(.semibold))
                            .foregroundColor(split.isDone ? .black : .white)
                    }
                )
        }
    }
}

extension RoutineBoxComponent {
    func dateFormatingForMonth(date: Date) -> String {
        let preferredLanguage: String = Locale.preferredLanguages.first ?? "USA"
        let preferredLanguagesCountry = String(preferredLanguage.prefix(2))
        var dateFormat: String = ""
        
        if (preferredLanguagesCountry == "ko") {
            dateFormat = "M월"
        } else if (preferredLanguagesCountry == "ja" || preferredLanguagesCountry == "zh") {
            dateFormat = "M月"
        } else {
            dateFormat = "MMM"
        }
        let userLocale = Locale.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = userLocale
        
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
    
    func dateFormatingForDay(date: Date) -> String {
        let preferredLanguage: String = Locale.preferredLanguages.first ?? "USA"
        let preferredLanguagesCountry = String(preferredLanguage.prefix(2))
        var dateFormat: String = ""
        
        if (preferredLanguagesCountry == "ko") {
            dateFormat = "d일"
        } else if (preferredLanguagesCountry == "ja" || preferredLanguagesCountry == "zh") {
            dateFormat = "d日"
        } else {
            dateFormat = "dd"
        }
        
        let userLocale = Locale.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = userLocale
        
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
    
    func compareWithToday(targetDate: Date) -> Bool {
        // 今日の日付を取得
        let currentDate = Date()

        // split オブジェクトから splitDate を取得
        let splitDate = targetDate

        // 日付フォーマットを設定
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        // 今日の日付と splitDate の日付を文字列に変換
        let currentDateString = dateFormatter.string(from: currentDate)
        let splitDateString = dateFormatter.string(from: splitDate)
        
        return currentDateString == splitDateString
    }
}

#Preview {
    RoutineBoxComponent()
}
