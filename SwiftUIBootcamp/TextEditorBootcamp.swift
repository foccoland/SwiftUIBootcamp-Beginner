//
//  TextEditorBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditorText: String = "Starting text."
    @State var savedText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundColor(.green)
                    .colorMultiply(.gray.opacity(0.5))
                    .cornerRadius(10)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Text(savedText)
                    .padding()

                Spacer()
            }
            .padding()
            .background(.white)
            .navigationTitle("TextEditor Bootcamp!")
            
        }
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
