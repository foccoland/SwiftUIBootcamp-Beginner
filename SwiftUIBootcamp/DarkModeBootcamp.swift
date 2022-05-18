//
//  DarkModeBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("This text is primary")
                        .foregroundColor(.primary)
                    Text("This text is secondary")
                        .foregroundColor(.secondary)
                    Text("This text is black")
                        .foregroundColor(.black)
                    Text("This text is white")
                        .foregroundColor(.white)
                    Text("This text is red")
                        .foregroundColor(.red)
                    Text("This text is globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This text is locally adaptive")
                        .foregroundColor(Color(colorScheme == .light ? .green : .yellow))
                    
                }
            }
            .navigationTitle("Dark mode bootcamp!")
        }
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkModeBootcamp()
                .preferredColorScheme(.light)
            DarkModeBootcamp()
                .preferredColorScheme(.dark)
        }
    }
}
