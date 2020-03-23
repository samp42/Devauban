//
//  ContentView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1 //open on new worksheet view by default
    /*
     init() {
        UITabBar.appearance().barTextColor = UIColor.gray
     }*/
    var body: some View {
        VStack{
            HeaderView()
            
            TabView(selection: $selection){
                WorksheetView()
                    .tabItem {
                        VStack {
                            Image(systemName: "tray.fill")
                                .foregroundColor(Color.black)
                            Text("Feuilles de temps")
                        }
                    }
                    .tag(0)
                    NewWorksheetView().environmentObject(Worksheet())
                .tabItem {
                    VStack {
                        Image(systemName: "plus.square.fill").background(Color.black)
                        Text("Nouvelle feuille")
                    }
                }
                .tag(1)
                
                ScrollView(.vertical){
                    AccountView()
                }
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Compte")
                        }
                }
                .tag(2)
            }//End of TabView
                .accentColor(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Worksheet())
    }
}
