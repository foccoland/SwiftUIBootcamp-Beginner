//
//  AlertBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 11/05/22.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = .yellow
    
//    @State var alertTitle: String = ""
//    @State var alertMessage: String = ""
    
    @State var alertType: MyAlerts? = nil
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Button 1") {
                    alertType = .error
//                    alertTitle = "Error uploading video"
//                    alertMessage = "Video could not be uploaded"
                    showAlert.toggle()
                }
                Button("Button 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video 💪🏼"
//                    alertMessage = "Your video is now online!"
                    showAlert.toggle()
                }
            }.alert(isPresented: $showAlert) {
                //Alert(title: Text("Error here"))
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        
        //        return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        //        return Alert(
        //            title: Text("This is the title"),
        //            message: Text("Description of the error"),
        //            primaryButton: .destructive(Text("Delete")) {
        //                backgroundColor = .red
        //            },
        //            secondaryButton: .cancel()
        //        )
        
        
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error"))
        case .success:
            return Alert(title: Text("Success"), message: nil, dismissButton: .default(Text("Ok"), action: {
                backgroundColor = .green
            }))
        case .none:
            return Alert(title: Text("error"))
        }

    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
