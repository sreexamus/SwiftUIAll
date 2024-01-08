//
//  ContentView.swift
//  CalendarSwiftUI
//
//  Created by sreekanth reddy iragam on 4/3/23.
//

import SwiftUI
struct Nature: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct ContentView: View {
    @State var currentDate = Date()

       var body: some View {
           VStack {
               HStack {
                   Button(action: {
                       currentDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)!
                   }) {
                       Image(systemName: "arrow.left")
                   }
                   Text("\(currentDate) \(currentDate)")
                   Button(action: {
                       currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
                   }) {
                       Image(systemName: "arrow.right")
                   }
               }
               Divider()
               VStack {
                   ForEach(monthDays(), id: \.self) { week in
                       HStack(spacing: 0) {
                           ForEach(week, id: \.self) { day in
                               Text(day)
                                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                                   .background(Color.white)
                                   .cornerRadius(10)
                           }
                       }
                   }
               }
               Divider()
           }
       }

       func monthDays() -> [[String]] {
           var calendar = Calendar.current
           calendar.firstWeekday = 1 // Sunday = 1, Monday = 2, etc.
           let monthRange = calendar.range(of: .day, in: .month, for: currentDate)!
           let numDays = monthRange.count
           let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
           let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
           var days: [[String]] = [[]]
           for _ in 1..<firstDayWeekday {
               days[0].append("")
           }
           var currentWeek = 0
           for i in 1...numDays {
               if days[currentWeek].count == 7 {
                   currentWeek += 1
                   days.append([])
               }
               days[currentWeek].append(String(i))
           }
           for _ in days[currentWeek].count..<7 {
               days[currentWeek].append("")
           }
           return days
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
