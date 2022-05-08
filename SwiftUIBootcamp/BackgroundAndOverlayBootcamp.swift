//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(
////                LinearGradient(
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 100, height: 100, alignment: .center)
//            )
//            .background(
//                Circle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [.green, .orange]), startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 120, height: 120, alignment: .center)
//
//            )
        
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100)
//            .overlay {
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            }
//            .background {
//                Circle()
//                    .fill(.purple)
//                    .frame(width: 110, height: 110)
//            }
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(alignment: .topLeading) {
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: 50, height: 50)
//            }
//            .background(alignment: .bottomTrailing) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//            }
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.50)), radius: 10, x: 0.0, y: 10.0)
                    .overlay(alignment: .bottomTrailing, content: {
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35)
                            .overlay {
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.70)), radius: 5, x: 5.0, y: 5.0)
                    })
            )
    }
}

struct BackgroundAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayBootcamp()
    }
}
