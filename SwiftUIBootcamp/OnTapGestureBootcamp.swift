//
//  OnTapGestureBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct OnTapGestureBootcamp: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            // acts just like a button without highlight white-ish pressed state
            Text("Tap gesture")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }

            
            Spacer()

        }
        .padding(40)
    }
}

struct OnTapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnTapGestureBootcamp()
    }
}
