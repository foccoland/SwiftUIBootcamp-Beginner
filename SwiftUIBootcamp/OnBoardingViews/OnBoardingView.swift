//
//  OnBoardingView.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 17/05/22.
//

import SwiftUI

struct OnBoardingView: View {
    
    // Onboarding states:
    /**
         0 - welcome screen
         1 - Add name
         2 - Add age
         3 - Add gender
     */
    
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        //insert from trailing
        insertion: .move(edge: .trailing),
        // remove from leading
        removal: .move(edge: .leading)
    )
    
    // onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var isCurrentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            // content
            
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            }
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(alertTitle, isPresented: $showAlert, presenting: name) { name in
            Button("Ok", action: {})
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(.purple)
    }
}

// MARK: - Components
extension OnBoardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Sign up" : onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                }
            Text("Number one app for finding your match online! I'm just practicing SwiftUI of course. :)")
                .foregroundColor(.white)
                .font(.headline)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
//    We can't instanciate this here cause we're inside an extension
//    @State var textFieldText: String = ""
    
    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            TextField("Your name here", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white.opacity(0.8))
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            
        Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
              
            Menu {
                Picker(selection: $gender, content: {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Non-Binary").tag("Non-Binary")
                }, label: {

                })
            } label: {
                Text(gender.count > 0 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.8))
                    .cornerRadius(10)
            }
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
}

// MARK: - Functions

extension OnBoardingView {
    
    func handleNextButtonPressed() {
        
        // check inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                // don't execute next lines, keeping user on this screen
                showAlert(title: "Your name must be at least 3 characters long! 🫢")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! 🥸")
                return
            }
        default:
            break
        }
        // go to next section
        if onboardingState == 3 {
            // sign in
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            isCurrentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
