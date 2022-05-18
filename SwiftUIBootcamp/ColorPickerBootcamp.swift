//
//  ColorPickerBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct ColorPickerBootcamp: View {
//
//    to be reviewed
//    init() {
//        UINavigationBarAppearance().configureWithTransparentBackground()
//        UINavigationBarAppearance().backgroundColor = .orange
//    }
    
    @State var backgroundColor: Color = .green
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                ColorPicker(
                    "Select a color",
                    selection: $backgroundColor,
                    supportsOpacity: true
                )
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
                .padding(50)
                .shadow(color: .black.opacity(0.7), radius: 10, x: 0.0, y: 0.0)
            }
            .navigationTitle("ColorPicker bootcamp!")
            
        }
        // to be reviewed
//        .navigationViewStyle(StackNavigationViewStyle())
//        .tint(.orange)
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
