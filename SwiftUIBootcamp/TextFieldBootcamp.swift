//
//  TextFieldBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 12/05/22.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var dataArray: [String] = []
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something", text: $textFieldText)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                    .onSubmit {
                        showAlert.toggle()
                    }
                
                // Deprecated
                //TextField("Type something deprecated", text: $textFieldText, onEditingChanged: make something while editing)
                //TextField("Type something deprecated", text: $textFieldText, onCommit: make something on submit)
                
                Button {
                    if textIsValid() {
                        saveText()
//                        showAlert.toggle()
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsValid() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                        
                }
                .disabled(!textIsValid())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .alert("An alert displayed after submitting this form", isPresented: $showAlert, actions: {
                Button("Ok", role: .cancel) {
                    //
                }
            })
            
            .navigationTitle("TextField Bootcamp!")
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
