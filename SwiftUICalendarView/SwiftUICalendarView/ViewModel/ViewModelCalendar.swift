//
//  ViewModelCalendar.swift
//  SwiftUICalendarView
//
//  Created by sreekanth reddy iragam on 12/9/21.
//

import Foundation
import SwiftUI
import SwiftyHolidays


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let holidays = [Country.unitedStates.allHolidays(in: 2021), Country.unitedStates.allHolidays(in: 2022)]

enum DayState {
    case today
    case someDay
    case noDay
    case holiday
}
struct DaysInMonth: Identifiable {
    var id = UUID()
    let title: String
    let state: DayState
}

class CustomCalendarViewModel: ObservableObject {
    let currentDate = Date()
    var currentMonth = 0
    var currentViewNumber = 0
    var daysInMonthAll: [DaysInMonth] = []
    var allDaysArrayRows: [[DaysInMonth]] = []
    var title: String = ""
    
    func getAllDaysOfMonth() {
        allDaysArrayRows = []
        daysInMonthAll = []
        let noOfDays = getNoOfDaysInMonthFinal(section: currentMonth)
        (0...noOfDays-1).forEach { index in
            daysInMonthAll.append(getTitleAndColor(currentViewNumber: index))
           
        }
        
        print("daysInMonthAll count .. \(daysInMonthAll.count)")
        allDaysArrayRows = daysInMonthAll.chunked(into: 7)
        print("noOfDays .. \(noOfDays)")
        print("currentMonth .. \(currentMonth)")
        print("all daye row count.. \(allDaysArrayRows.count)")
        
        getHeaderTitle(addMonth(currentDate, month: currentMonth))
    }
    
    
    func getAcutalDayNumberInMonth(month: Int, currentView: Int) -> Int {
        let firstDayOfTheWeekInAMonth = getDayOfWeek(startOfMonth(addMonth(currentDate, month: month)))
        return currentView + 1 - firstDayOfTheWeekInAMonth!
    }
    
    func getTitleAndColor(currentViewNumber: Int) -> DaysInMonth {
        let currentDay = getAcutalDayNumberInMonth(month: currentMonth, currentView: currentViewNumber)
        // print("currentDay.. \(currentDay)")
        let title: String
        var state = DayState.noDay
        if currentDay >= 0 {
            title = String(currentDay + 1)
            state = .someDay
        } else {
            title = ""
            state = .noDay
        }
        
        if currentMonth == 0 && getDayInInt(date: currentDate) == Int(title) {
            state = .today
        }
        
        
        return DaysInMonth(title: title, state: state)
    }
    
    func isLessThanDate(_ date: Date, dateToCompare: Date) -> Bool {
        var isLess = false
        if date.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        return isLess
    }
    
    func isGreaterThanDate(_ date: Date, dateToCompare: Date) -> Bool {
        return date.compare(dateToCompare) == ComparisonResult.orderedDescending
    }
    
    func getDaysInMonth(_ date: Date) -> Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: calendar.component(.year, from: date), month: calendar.component(.month, from: date))
        let converedDate = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: converedDate)!
        let numDays = range.count
        
        return numDays
    }
    
    func addMonth(_ date: Date, month: Int) -> Date {
        guard let convertedDate = Calendar.current.date(byAdding: .month, value: month, to: date) else {
            return Date()
        }
        print("convertedDate.. \(convertedDate)")
        return convertedDate
    }
    
    func startOfMonth(_ date: Date) -> Date {
        guard let convertedDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: date))) else {
            return Date()
        }
        return convertedDate
    }
    
    func endOfMonth(_ date: Date) -> Date {
        guard let convertedDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth(date)) else {
            return Date()
        }
        return convertedDate
    }
    
    func getDayOfWeek(_ date: Date) -> Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: date)
        return weekDay
    }
    
    func getNoOfDaysInMonthFinal(section: Int) -> Int {
        let firstDayOfTheWeekInAMonth = getDayOfWeek(startOfMonth(addMonth(currentDate, month: section)))
        print("firstDayOfTheWeekInAMonth.. \(firstDayOfTheWeekInAMonth)")
        let noOfDaysLeft = (firstDayOfTheWeekInAMonth ?? 0) - 1
        print("noOfDaysLeft.. \(noOfDaysLeft)")
        let noOfDaysInMonth = Utility.getDaysInMonth(Utility.addMonth(Date(), month: section)) + noOfDaysLeft
        print("noOfDaysInMonth.. \(noOfDaysInMonth)")
        return noOfDaysInMonth
    }
    
    func getHeaderTitle(_ date: Date)  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        let titleValue = dateFormatter.string(from: date)
        print("title.. \(titleValue)")
        title = titleValue
    }
    
    func getDay(_ date: Date, day: Int) -> Date {
        guard let day = Calendar.current.date(byAdding: .day, value: day, to: date),
            let convertedDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: day) else {
                return Date()
        }
        return convertedDate
    }
    
    func getYearOnly(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: date)
    }
    
    func getTitleDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        return dateFormatter.string(from: date)
    }
    func stripTime(from originalDate: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: originalDate)
        let date = Calendar.current.date(from: components)
        return date!
    }
    
    func getDayName(_ index: Int) -> String {
        return Calendar.current.shortWeekdaySymbols[index]
    }
    
    func getWeekDayName(_ index: Int) -> String {
        return Calendar.current.standaloneWeekdaySymbols[index]
    }
    
    func getMonth(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        let month = components.month
        return month ?? 0
    }
    
    func getYear(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        let year = components.year
        return year ?? 0
    }
    
    func getDayInInt(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let day = components.day
        return day ?? 0
    }
    
}

