//
//  IfLetAndGuardBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct IfLetAndGuardBootcamp: View {
    
    @State var currentUserID: String? = "test123"
    @State var displayText: String? = nil
    @State var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                
                Text("Practicing safe coding")
                
                if let text = displayText {
                    Text(text)
                }
                // Just never do this
//                Text(displayText!)
//                    .font(.title)
                
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Safe coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        
        if let userId = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! UserID: \(userId)"
                isLoading = false
            }
        } else {
            displayText = "Error: no userID"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserID else {
            displayText = "Error: no userID"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! UserID: \(userID)"
            isLoading = false
        }
    }
}

struct IfLetAndGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetAndGuardBootcamp()
    }
}
