//
//  AppStorageBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 17/05/22.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
//    for UserDefaults we need to use @State, but is no longer needed with @AppStorage
//    @State var currentUserName: String?
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add name here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save") {
                let name = "Fabio"
                currentUserName = name
//                we no longer need to SAVE data using UserDefaults, AppStorage do all the jobs
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        we no longer need to FETCH from UserDefaults, AppStorage do all the job
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
