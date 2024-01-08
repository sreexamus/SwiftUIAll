//
//  ContentView.swift
//  SwiftUIList
//
//  Created by sreekanth reddy iragam on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var items = ["newyork", "dallas", "omaha", "lasvwgas", "charlotte"]
    var body: some View {
        List {
            Section("My Cities") {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onDelete { index in
                    deleteRow(index: index)
                }.onMove { currentOffset, newOffset in
                    move(currentOffset: currentOffset, newOffset: newOffset)
                }
                .listRowBackground(Color.cyan)
            }
        }.navigationTitle("New List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .listStyle(.automatic)
            
    }
    
    func move(currentOffset: IndexSet, newOffset: Int) {
        items.move(fromOffsets: currentOffset, toOffset: newOffset)
    }
    
    func deleteRow(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    var addButton: some View {
        Button("Add") {
            items.append("Houston")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
