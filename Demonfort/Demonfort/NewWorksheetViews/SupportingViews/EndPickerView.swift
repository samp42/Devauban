//
//  EndPickerView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-23.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct EndPickerView: View {
    @State private var end = Date()
    
    var body: some View {
        VStack{
            DatePicker(selection: $end, label: {
                Text("Fin")
                    .fontWeight(.semibold).frame(minWidth: 80)
            }).labelsHidden()
        }
    }
}

struct EndPickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        EndPickerView()
        
    }
}