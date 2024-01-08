//
//  MonthSubView.swift
//  SwiftUICalendarView
//
//  Created by sreekanth reddy iragam on 12/5/21.
//

import SwiftUI

extension Array {

    subscript (range r: Range<Int>) -> Array {
        return Array(self[r])
    }


    subscript (range r: ClosedRange<Int>) -> Array {
        return Array(self[r])
    }
}

struct HorizontalDaysView: View {
    let data: [DaysInMonth]
    var body: some View {
        
        LazyHStack(spacing: 10) {
            ForEach(data) { day in
                let colorData = getColor(day.state)
                Button(day.title) {
                    print("sdfd \(day.title)")
                }.frame(width: 38,
                        height: 38,
                        alignment: .center)
                    .background(colorData)
                    .cornerRadius(8)
            }
            Spacer()
        }
    }
    
    func getColor(_ state: DayState) -> Color {
        var colorData = Color.white
        switch state  {
        case .noDay:
            colorData = Color.clear
        case .someDay:
            colorData = Color.cyan
        case .today:
            colorData = Color.green.opacity(1)
        case .holiday:
            colorData = Color.green.opacity(1)
        }
        
        return colorData
    }
    
}

struct MonthSubView: View {
    var vm: CustomCalendarViewModel
    init(vm: CustomCalendarViewModel,
         month: Int) {
        self.vm = vm
        self.vm.currentMonth = month
        vm.getAllDaysOfMonth()
    }

    var body: some View {
        Section(header:  ZStack(alignment: .leading) {
             Color.white.edgesIgnoringSafeArea(.all)
             Text(vm.title).foregroundColor(.black).font(.title).bold()
        }) {
            LazyVStack(alignment: .center, spacing: 8) {
                dayNamesView
                LazyVStack(alignment: .center,
                           spacing: 10) {
                    ForEach(0..<vm.allDaysArrayRows.count) { index in
                        HorizontalDaysView(data: vm.allDaysArrayRows[index])
                    }
                }
            }.padding(.all, 15)
        }
    }
    
    var dayNamesView: some View {
        LazyHStack(spacing: 10) {
            Group {
                Text("Sun")
                Text("Mon")
                Text("Tue")
                Text("Wed")
                Text("Thu")
                Text("Fri")
                Text("Sat")
            }
            .frame(width: 38, height: 38, alignment: .leading)
            .font(.body.bold())
            .background(Color.clear)
        }
    }
}

struct MonthSubView_Previews: PreviewProvider {
    static var previews: some View {
        MonthSubView(vm: CustomCalendarViewModel(), month: 0)
    }
}
