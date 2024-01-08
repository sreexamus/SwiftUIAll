//
//  ItemList2.swift
//  SwiftUIObservedStateObj
//
//  Created by sreekanth reddy iragam on 12/4/21.
//


//
 //If we mention Counter.datasource as @StateObject and instantiate datasource in the Counter that means we are creating new Datasource everytime Counter is created. then thos newly created datasource objects will be ignored, only the initial state object will be considered by Counter. It will be bug to create StateObject multiple times.
 
 //

import SwiftUI

struct ItemList2: View {
    @State private var items = ["3rd screen", "world"]

    var body: some View {
      VStack {
        Button("Append item to list") {
          items.append("test")
        }

        List(items, id: \.self) { name in
          Text(name)
        }

          Counter2(dataSource: DataSource2()).padding()
          NavigationLink("NextScreen") {
              //ItemList1()
          }
      }
    }
}

struct Counter2: View {
  @StateObject var dataSource = DataSource2()

  var body: some View {
    VStack {
      Button("Increment counter") {
        dataSource.counter += 1
      }

      Text("Count is \(dataSource.counter)")
    }
  }
}

class DataSource2: ObservableObject {
  @Published var counter = 0
}

struct ItemList2_Previews: PreviewProvider {
    static var previews: some View {
        ItemList2()
    }
}
