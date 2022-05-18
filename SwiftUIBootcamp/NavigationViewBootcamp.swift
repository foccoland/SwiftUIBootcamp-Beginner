//
//  NavigationViewBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 10/05/22.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        
        // one navview allowed in single view
        // adding another one will bring us to errors
        NavigationView {
            ScrollView {
                
                NavigationLink("Hello, world!",
                               destination: MyOtherScreen())
                
                Text("Hello")
                Text("Hello")
                Text("Hello")

            }
            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
            
//             Deprecated: use .toolbar instead (see below)
//            .navigationBarItems(
//                leading: Image(systemName: "person.fill"),
//                trailing: Image(systemName: "gear")
//            )
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "gear")
                        Image(systemName: "flame.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        MyOtherScreen()
                    } label: {
                        Image(systemName: "person.fill")
                    }
//                     Deprecated: use .tint instead
//                    .accentColor(.green)
                    .tint(.red)

                }
            }
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .navigationTitle("Green screen")
                //.navigationBarHidden(true)
            
            VStack {
                Button("Back button") {
                    presentationMode.wrappedValue.dismiss()
                }
                NavigationLink("Click here", destination: Text("Third screen"))
            }
        }
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
