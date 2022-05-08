//
//  GridBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct GridBootcamp: View {
    
    // spacing: change here for HORIZONTAL spacing (in case of LazyVGrid)
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        
        // MARK: - Easy Instagram? No probs!
//        ScrollView {
//            Rectangle()
//                .fill(.white)
//                .frame(height: 400)
//
//            LazyVGrid(columns: columns) {
//                ForEach(0..<50) { index in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
//        }
        
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            LazyVGrid(
                columns: columns,
                alignment: .center,
                // spacing: change here for VERTICAL spacing (in case of LazyVGrid)
                spacing: 6,
                pinnedViews: [.sectionHeaders]
            ) {
                Section(header: Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .padding()
                ) {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
                
                Section(header: Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .padding()
                ) {
                    ForEach(0..<50) { index in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                    }
                }
            }
        }
        
        
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
