//
//  PaddingAndSpacerBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        // MARK: - Padding intro
//        Text("Hello, World!")
//            .background(.yellow)
////            .padding() // default: 15
//            .padding(.all, 10)
//            .padding(.leading, 20)
//            .background(.blue)
        
        // MARK: - Real world card using padding onto Colors
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Text("This is description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
                
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 10,
                    x: 0.0,
                    y: 10
                )
        )
        .padding(.horizontal, 10)
        
//
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
