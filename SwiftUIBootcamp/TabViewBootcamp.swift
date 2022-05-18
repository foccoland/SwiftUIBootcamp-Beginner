//
//  TabViewBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]
    
    // just like viewpager
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(RadialGradient(colors: [.purple, .orange], center: .center, startRadius: 5, endRadius: 300))
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())

    }
    
    
    var classicTabView: some View {
        
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            Text("Browser tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(1)

            Text("Profile tab")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)

        }
        .accentColor(.red)
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
