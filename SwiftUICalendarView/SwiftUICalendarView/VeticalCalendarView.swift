//
//  VeticalCalendarView.swift
//  SwiftUICalendarView
//
//  Created by sreekanth reddy iragam on 12/9/21.
//

import SwiftUI

struct VeticalCalendarView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<12) { index in
                LazyVStack(spacing: 15, pinnedViews:[.sectionHeaders]) {
                    let vm =  CustomCalendarViewModel()
                    MonthSubView(vm: vm,
                                 month: index)
                        .background(Color.gray.opacity(0.2))
                      
                        .cornerRadius(15)
                }.padding()
            }
        }
    }
}

struct VeticalCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        VeticalCalendarView()
    }
}
