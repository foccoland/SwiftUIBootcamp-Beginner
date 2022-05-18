//
//  IntroView.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 17/05/22.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var isCurrentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                colors: [.red, .purple],
                center: .topLeading,
                startRadius: 0.0,
                endRadius: UIScreen.main.bounds.height
            ).ignoresSafeArea()
            
            if isCurrentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
            
            // is user is signed in
            // profile view
            // else
            // onboarding view
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
