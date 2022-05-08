//
//  StacksBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct StacksBootcamp: View {
    
    // MARK: - VStack
    // MARK: - HStack
    // MARK: - ZStack
    
    var body: some View {
        
        // MARK: - stacking stacks
//        ZStack(alignment: .top) {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500, alignment: .center)
//
//            VStack(alignment: .leading, spacing: 30) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150, alignment: .center)
//
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100, height: 100)
//
//                HStack(alignment: .bottom, spacing: 4) {
//                    Rectangle()
//                        .fill(.purple)
//                        .frame(width: 50, height: 50)
//
//                    Rectangle()
//                        .fill(.pink)
//                        .frame(width: 75, height: 75)
//
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 25, height: 25)
//                }
//                .background(.white)
//            }
//            .background(.blue)
//        }
        
        // MARK: - Real world cart example
//        VStack(alignment: .center, spacing: 20) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            Text("Items in your cart:")
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
        
        // MARK: - Multiple ways to z stacks views: background vs zstack
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(.gray)
                        .frame(width: 100, height: 100)
                )
            
            // Personal preferred way
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .frame(width: 120, height: 120)
                .overlay {
                    Text("1")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .overlay(alignment: .topLeading) {
                    Circle()
                        .fill(.yellow)
                        .frame(width: 40, height: 40)
                }
                
        }
    
    }
}

struct StacksBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootcamp()
    }
}
