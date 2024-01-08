//
//  ContentView.swift
//  SwiftUIActionSheets
//
//  Created by sreekanth reddy iragam on 12/17/21.
//

import SwiftUI

enum SheetsOptions {
    case all
    case few
}

struct ContentView: View {
    @State var showActionSheet: Bool = true
    @State var sheet: SheetsOptions = .few
    var body: some View {
        VStack {
            if sheet == .all {
            Text("NewOne")
            }
            Button("Show Action Sheet") {
                showActionSheet = true
                sheet = .all
            }.actionSheet(isPresented: $showActionSheet, content: getActionSheet)
        }
    }
    
    func getActionSheet() -> ActionSheet {
        let cancelButton = ActionSheet.Button.cancel()
        let desButton = ActionSheet.Button.destructive(Text("desct"))
        let defButton = ActionSheet.Button.default(Text("new default"))
        
        switch sheet {
        case .all:
            return ActionSheet(title: Text("New Feature"), message: Text("working on new feature"), buttons: [defButton,cancelButton, desButton])
        case .few:
            return ActionSheet(title: Text("New Feature"), message: Text("working on new feature"), buttons: [cancelButton, desButton])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
