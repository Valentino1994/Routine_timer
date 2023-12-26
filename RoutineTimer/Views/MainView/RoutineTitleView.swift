//
//  RoutineView.swift
//  RoutineTimer
//
//  Created by Geunil Park on 2023/12/26.
//

import SwiftUI

struct RoutineTitleView: View {
    var isFirst: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dateFormating())
                    .font(
                        Font.custom("SF Pro Text", size: 16)
                        .weight(.semibold)
                    )
                    .foregroundColor(.white)
                Text("My Routines")
                    .font(
                        Font.custom("SF Pro Text", size: 26)
                        .weight(.semibold)
                    )
                    .foregroundColor(.white)
            }
            Spacer()
            Image("StartButton")
                .opacity(isFirst ? 0.0 : 1.0)
        }
        .padding(.horizontal, 20)
    }
}

extension RoutineTitleView {
    func dateFormating() -> String {
        let preferredLanguage: String = Locale.preferredLanguages.first ?? "USA"
        let preferredLanguagesCountry = String(preferredLanguage.prefix(2))
        var dateFormat: String = ""
        
        if (preferredLanguagesCountry == "ko") {
            dateFormat = "MM월 dd일, yyyy"
        } else if (preferredLanguagesCountry == "ja" || preferredLanguagesCountry == "zh") {
            dateFormat = "MM月 dd日, yyyy"
        } else {
            dateFormat = "MMM dd, yyyy"
        }
        
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
}

#Preview {
    RoutineTitleView(isFirst: false)
}
