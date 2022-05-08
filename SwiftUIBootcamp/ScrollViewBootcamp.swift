//
//  ScrollViewBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        
        // MARK: - Vertical
//        ScrollView(showsIndicators: false) {
//            VStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(height: 300)
//                }
//            }
//        }
        
        // MARK: - Horizontal
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 300, height: 300)
//                }
//            }
//        }
        
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10.0)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
