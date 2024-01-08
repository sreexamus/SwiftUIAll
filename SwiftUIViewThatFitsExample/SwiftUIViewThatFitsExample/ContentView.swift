//
//  ContentView.swift
//  SwiftUIViewThatFitsExample
//
//  Created by sreekanth reddy iragam on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    let allData = ["sree", "sfbanfbdmnfbdnfbsdnfbdsnfdsnmfdsbmnfdmn", "1sdfmndsnfdnfsdbnfbdnfbdnijk1jbjkjdjfdjfdsjfdjfdfbjdfsjdnfsdnfsmfndmfndmsnf,sndmfnmfdm,nfmdsnfmsdfn,mndf,mdn,dn,mfn,df,m,mf2",
        "343",
        "3asfbkfbdsjfbdsjbfdkfbdfbsfkjjdbkjkfdnfjdnfsbfbdsfbdsbfdbkfjdbkjdbskjfbdskjfbkdsbfdbjfb,dsbf,mdb,fdbs,fbd,mfb,dfb,dfb,fsdfdsfdsfsdjhgg,hgghghjg,jkgjhjg,j,j4"]
    var body: some View {
        VStack {
            ForEach(allData, id: \.self) { myData in
                // use the first view if it fits in one line.. If not the secondview(hstack) with be viewed with more button
                ViewThatFits {
                    Text(myData)
                    HStack {
                        Text(myData).lineLimit(2)
                        Button("more") {
                            
                        }
                    }
                }
               
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
