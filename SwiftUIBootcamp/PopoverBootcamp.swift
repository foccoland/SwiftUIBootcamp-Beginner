//
//  PopoverBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 10/05/22.
//

import SwiftUI

struct PopoverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
            
            // MARK: - Method 1: Sheet
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            // MARK: - Method 2: Transition
            // Method 2.1: out of the box this way we have transition in BUT NOT OUT,
            // so we add a ZStack (in Method 2.2, this will be commented out and copied as is below wrapped in ZStack)
//            if showNewScreen {
//                NewScreen(showNewScreen: $showNewScreen)
//                    .padding(.top, 100)
//                    .transition(.move(edge: .bottom))
//                    .animation(.spring())
//            }
            
            // Method 2.2: for get transition animation in but out also of course: embed in a zIndex zstack
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }.zIndex(2.0)
            
            // MARK: - Method 3: Animation offset
            
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
            
            /*
                What would I choose?
                Method 2 and 3 allow different animation transitions, method 1 doesn't, so they're more flexible!
             */
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .cornerRadius(25)
                .ignoresSafeArea()
            Button {
                //presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct PopoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopoverBootcamp()
//        NewScreen()
    }
}
