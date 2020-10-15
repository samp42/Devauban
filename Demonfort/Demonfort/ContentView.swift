//
//  ContentView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-02-01.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.listen()
    }
    
    var body: some View {
        VStack{
            Group{
                if(session.session == nil && session.worker == nil){
                    AuthView()
                } else {
                    Group {
                        HeaderView()
                        MainView().environmentObject(session)
                    }
                }
            }
        }//.onAppear(perform: getUser)//outer group
    }
}

struct ContentView_Previews: PreviewProvider {
    static let session = SessionStore()
    
    static var previews: some View {
        ContentView().environmentObject(session)
    }
}
