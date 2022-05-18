//
//  BindingBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 09/05/22.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }

        }
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}

struct ButtonView: View {
    // needed for change parent view attribute (same name: backgroundColor)
    @Binding var backgroundColor: Color
    
    // no need for binding here, button itself is inside this view
    @State var buttonColor: Color = .blue
    
    // needed for change parent view attribute (same name: title)
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = .orange
            buttonColor = .pink
            title = "New title!"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 10)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}
