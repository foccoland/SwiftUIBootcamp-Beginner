//
//  ToggleBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
                    
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn) {
                    Text("Label")
                }
    //             Deprecated: use .tint instead
    //            .toggleStyle(SwitchToggleStyle(tint: .red))
            .tint(.orange)
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
