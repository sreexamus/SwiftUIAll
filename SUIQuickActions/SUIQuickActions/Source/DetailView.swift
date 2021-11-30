//
//  DetailView.swift
//  SUIQuickActions
//
//  Created by sreekanth reddy iragam on 11/29/21.
//

import SwiftUI

struct DetailView: View {
    var name: String
    var body: some View {
        Text("\(name) View")
            .bold()
            .navigationBarTitle(name)
                   
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "red")
    }
}
