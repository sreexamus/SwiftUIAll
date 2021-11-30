//
//  ContentView.swift
//  SUIQuickActions
//
//  Created by sreekanth reddy iragam on 11/29/21.
//

import SwiftUI

struct QuickListView: View {
    @EnvironmentObject var quickActionSettings: QuickActionSettings
    @State var selectedAction: Int?
    
    var body: some View {
        NavigationView {
                  List {
                      ForEach(0..<allQuickActions.count) { index in
                          NavigationLink(destination: DetailView(name: allQuickActions[index].name),
                                         tag: allQuickActions[index].tag,
                                         selection: $quickActionSettings.quickAction) {
                              Text(allQuickActions[index].name)
                                  .bold()
                                  .background(Color.blue)
                                  .foregroundColor(.cyan)
                                  .cornerRadius(5)
                          }
                      }
                  }
                  .listStyle(SidebarListStyle())
                  .navigationBarTitle("Quick Actions")
        }
        .accentColor(Color(.label))
        /// it will set porper color a/c to Dark Mode, light Mode
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuickListView().preferredColorScheme(.light).environmentObject(quickActionSettings)
    }
}
