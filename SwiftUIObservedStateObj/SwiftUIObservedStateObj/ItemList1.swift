//
//  ItemList1.swift
//  SwiftUIObservedStateObj
//
//  Created by sreekanth reddy iragam on 12/4/21.
//

//
 //If  we mention Counter.datasource as @StateObject then datasource object is not created fresh even though Counter is created fresh. That means Counter will hold the state of the datasource object.
 
 //

import SwiftUI

struct ItemList1: View {
  @State private var items = ["2nd Screen", "world"]

  var body: some View {
    VStack {
      Button("Append item to list") {
        items.append("test")
      }

      List(items, id: \.self) { name in
        Text(name)
      }

        Counter1().padding()
        NavigationLink("NextScreen") {
            ItemList2()
        }
    }
  }
}

struct Counter1: View {
  @StateObject var dataSource = DataSource1()

  var body: some View {
    VStack {
      Button("Increment counter") {
        dataSource.counter += 1
      }

      Text("Count is \(dataSource.counter)")
    }
  }
}

class DataSource1: ObservableObject {
  @Published var counter = 0
}


struct ItemList1_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}

