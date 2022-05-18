//
//  TernaryBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 09/05/22.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25)
                .fill(isStartingState ? .red : .blue)
                .frame(width: isStartingState ? 200 : 100, height: isStartingState ? 100 : 200)
            
            Spacer()
        }
    }
}

struct TernaryBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBootcamp()
    }
}
