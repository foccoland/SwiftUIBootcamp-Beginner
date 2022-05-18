//
//  ContextMenuBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 12/05/22.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = Color.purple.opacity(0.7)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Fabio SwiftUI!")
                .font(.headline)
            Text("How top use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(20)
        .background(
            backgroundColor
                .cornerRadius(30)
        )
        .contextMenu {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Share post", image: "flame.fill")
            }
            
            Button {
                backgroundColor = .red
            } label: {
                Text("Report post")
            }
            
            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                }
            }
        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
