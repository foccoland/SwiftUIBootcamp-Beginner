//
//  SheetsBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 10/05/22.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(
                        Color.white
                            .cornerRadius(10)
                    )
            }
            // fullScreenCover can be call just once, so it can't be chained more times
            // fullScreenCover covers all the screen area (including safe area)
            // sheet presents a modal sheet (it's not going to the very top of the screen)
            // is not possible to use fullScreenCover and sheet together
            .fullScreenCover(isPresented: $showSheet, content: {
                SecondScreen()
            })
            // sheet is possible to call once, so it can't be chained more times
//            .sheet(isPresented: $showSheet) {
//                // never insert conditionals in this scope, it brings to errors
//                SecondScreen()
//            }

        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct SheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootcamp()
        //SecondScreen()
    }
}
