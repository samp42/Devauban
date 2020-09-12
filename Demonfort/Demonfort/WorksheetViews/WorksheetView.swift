//
//  WorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct WorksheetView: View {
    //change to worker when will be able to retrieve data from workerWorksheets
    @EnvironmentObject var worker: Worker
    @State private var worksheets: [String:[String:Any]] = ["":["":""]]
//    var drag: some Gesture{
//        DragGesture(){_ in
//            .onEnded{
//                self.worksheet.refresh()
//                
//            }
//        }
//    }
    
    /**
        *To do:
        - Lock Navigation View title so that it scrolls with the list instead of staying in place
        - Insert optionnal error message under Navigation View title if loading documents from firebase was to fail
        - Make WorksheetRowView() retrieve its data from Worksheet.worksheets
     */

    //if no error
    var body: some View {
         NavigationView{
            if self.worker.worksheets.isEmpty {
                //if successfully retrieves worksheets from firebase
            
                List{
                    ForEach(0..<self.worker.numOfDocs){_ in
                        NavigationLink(destination: WorksheetDetailView()){
                            WorksheetRowView(startTime: Date(), endTime: Date(), workPlace: "Some place")
                        }

                    }
                }.navigationBarTitle("Feuilles de temps")
                    .onAppear{self.worksheets = self.worker.fetchWorksheetsOfWorker(email: Auth.auth().currentUser!.email!)
                }
                    .gesture(
                        DragGesture()
                        //refresh festure
                    )
            } else {
                //error fetching documents
                Text("Error loading documents from database.")
            }
        }
    }
}

struct WorksheetView_Previews: PreviewProvider {
    static let worker = Worker()
    
    static var previews: some View {
        WorksheetView().environmentObject(worker)
    }
}
