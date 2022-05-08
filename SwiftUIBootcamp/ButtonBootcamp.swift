//
//  ButtonBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
            
            // MARK: - Classic button
            Button("Press me!") {
                self.title = "Button was pressed"
            }
            .accentColor(.red)
            
            // MARK: - Button with customizable content
            Button {
                self.title = "Button #2 was pressed"
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            
            VStack(spacing: 20) {
                Button {
                    self.title = "Button was pressed"
                } label: {
                    Circle()
                        .fill(.blue)
                        .frame(width: 75, height: 75)
                        .shadow(radius: 10)
                        .overlay {
                            Image(systemName: "heart.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                        }
                }
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
            }
            
            Button {
                
            } label: {
                Text("Finish".uppercased())
                    .font(.callout)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 3.0)
                    )
            }



        }
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
