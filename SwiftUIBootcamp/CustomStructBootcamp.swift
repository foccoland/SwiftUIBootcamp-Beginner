//
//  CustomStructBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct User: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let followers: Int
    let isVerified: Bool
}

struct CustomStructBootcamp: View {
    
    let users: [User] = [
        User(name: "Rossana", followers: 5000, isVerified: true),
        User(name: "Fabio", followers: 40, isVerified: false),
        User(name: "Franco", followers: 600, isVerified: false),
        User(name: "Michele", followers: 300, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                // foreach without id param because is inside User struct (adopting identifiable protocol)
                ForEach(users) { user in
                    HStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.orange.opacity(0.4))
                            .overlay {
                                Image(systemName: "person.fill")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                            }
                        VStack(alignment: .leading) {
                            HStack {
                                Text(user.name)
                                if user.isVerified {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            Text("@\(user.name)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(String(user.followers))
                            
                    }
                }
            }
            .navigationTitle("Users info")
        }
    }
}

struct CustomStructBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomStructBootcamp()
    }
}
