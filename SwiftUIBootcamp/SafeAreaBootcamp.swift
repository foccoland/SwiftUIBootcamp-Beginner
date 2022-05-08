//
//  SafeAreaBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        
        
        ScrollView {
            VStack {
                Text("title goes here")
                    .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                }
                
            }
            
        }
        .background(.blue)
        .background(
            Color.red
                .ignoresSafeArea(edges: .top)
        )
//        ZStack {
//
//            // background
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//            // foreground
//            VStack {
//                Text("Hello, World!")
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
//        }
    }
}

struct SafeAreaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBootcamp()
    }
}
