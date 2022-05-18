//
//  OnAppearBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 15/05/22.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var myText: String = "Start text"
    
    @State var count: Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                            .onDisappear {
                                count -= 1
                            }
                    }
                }
            }
            // it runs immediately after scrollview renders itself
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text"
                }
            })
            // launched when view disappears (i.e.: when user leaves screen),
            // used for cleaning local db or caches
            .onDisappear(perform: {
                myText = "Ending text."
            })
            .navigationTitle("On Appear: \(count)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
