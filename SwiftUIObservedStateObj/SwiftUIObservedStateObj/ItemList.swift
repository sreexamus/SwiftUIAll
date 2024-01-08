//
//  ContentView.swift
//  SwiftUIObservedStateObj
//
//  Created by sreekanth reddy iragam on 12/4/21.
//

//
 //If  we mention Counter.datasource as ReservedObject then it gets created everytime Counter is created.
// In this case we loose the data that data source holds
 
 //


import SwiftUI

struct ItemList: View {
  @State private var items = ["1st Screen", "chance"]
  var isPresented = false
  var body: some View {
      NavigationView {
          VStack {
              Button("Append item to list") {
                  items.append("test")
              }
              
              List(items, id: \.self) { name in
                  Text(name)
              }
              
              Counter()
              NavigationLink("NextScreen") {
                  ItemList1()
              }
          }
      }
  }
}

struct Counter: View {
  @ObservedObject var dataSource = DataSource()

  var body: some View {
    VStack {
      Button("Increment counter") {
        dataSource.counter += 1
      }

      Text("Count is \(dataSource.counter)")
    }
  }
}

class DataSource: ObservableObject {
  @Published var counter = 0
}


struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
