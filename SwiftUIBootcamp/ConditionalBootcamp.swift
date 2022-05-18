//
//  ConditionalBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 09/05/22.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var isLoading: Bool = false
    var body: some View {
        
        //booleanTests
        showProgress
    }
    
    var showProgress: some View {

        VStack {
            Button("Is loading: \(isLoading.description)") {
                isLoading.toggle()
            }
            if isLoading {
                ProgressView()
            }
        }
    }
    
    var booleanTests: some View {
        VStack(spacing: 20) {
            
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            // exclusive: with 2 trues case "circle with rectangle" will not execute
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            } else if showRectangle {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//            }
            
            // inclusive: with 2 trues "circle and rectangle" will execute of course
            if showCircle {
                Circle()
                    .frame(width: 100, height: 100)
            }
            
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            if showCircle && showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 100)
            }
            
            Spacer()
        }
    }
}

struct ConditionalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootcamp()
    }
}
