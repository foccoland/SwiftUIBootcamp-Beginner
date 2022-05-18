//
//  ActionSheetBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 12/05/22.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    @State var showButtonActionSheet: Bool = false
    
    
    let title = Text("What you would like to do?")

    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var instaPost: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isMyPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                .tint(.primary)

                
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
    }
    
    var body: some View {
        
        VStack {
            instaPost
                // DEPRECATED: use confirmationDialog instead
                //.actionSheet(isPresented: $showActionSheet, content: getActionSheet)
                .confirmationDialog("What you would like to do?", isPresented: $showActionSheet) {
                    Button("Nothing", role: .none) {
                        // nothing
                    }
                    Button("Delete", role: .destructive) {
                        // delete all
                    }
                } message: {
                    Text("What would u do?")
                }
            
            // also from buttons
            Button("Delete all", role: .destructive) {
                showButtonActionSheet.toggle()
            }
            .confirmationDialog("Delete!", isPresented: $showButtonActionSheet) {
                Button("Delete all from button", role: .destructive) {
                    // delete all
                }
            }
            .padding(.vertical)

        }
    }
    
    // while alerts shows up to 2 buttons, action sheets can display a bunch of them
    func getActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // share
        }
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // report
        }
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // delete
        }
        
        let cancelButton: ActionSheet.Button = .cancel()
        
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton]
            )
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton]
            )
        }
        
        //return ActionSheet(title: Text("This is the title!"))
        
//        let button1: ActionSheet.Button = .default(Text("DEFAULT"))
//        let button2: ActionSheet.Button = .destructive(Text("DESTRUCTIVE"))
//        let button3: ActionSheet.Button = .cancel(Text("CANCEL"))
//
//        return ActionSheet(
//            title: Text("This is the title"),
//            message: Text("Message"),
//            buttons: [button1, button1, button1, button1, button2, button3]
//        )
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
