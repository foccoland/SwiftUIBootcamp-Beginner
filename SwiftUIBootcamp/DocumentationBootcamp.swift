//
//  DocumentationBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: - Properties
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    
    // MARK: - Body
    
    // Working copy - TODO: fix title
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(data, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
            }
            .navigationTitle("Documentation Bootcamp")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Alert") {
                        showAlert.toggle()
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                getAlert(text: "This is the alert")
            }
        }
    }
    
    // MARK: - Functions
    
    
    /// Gets an alert with a specified title
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter, without message.
    /// ```
    /// getAlert(text: "Hi") -> Alert(title: Text("Hi))
    /// ```
    ///
    /// - Warning: There is no message in this alert.
    /// - Parameter text: Title of the alert
    /// - Returns: an Alert with the submitted title
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
    
    /// This is a funky alert
    func getFunkyAlert() -> Alert {
        return Alert(title: Text("Hey i'm funky!"))
    }
}

// MARK: - Preview

struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
