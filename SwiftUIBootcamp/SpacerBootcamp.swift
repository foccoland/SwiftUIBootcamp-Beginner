//
//  SpacerBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        
        // MARK: - get spacers pushed over the edges of the screen or getting 0 if space between rects begin to short
//        HStack(spacing: 0) {
//            Spacer(minLength: 0)
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .frame(width: 50, height: 50)
//            // better use spacers to reach this result
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.green)
//                .frame(width: 50, height: 50)
//
//            Spacer(minLength: 0)
//                .frame(height: 10)
//                .background(.orange)
//
//        }
//        .background(.yellow)
////        .padding(.horizontal, 200)
//        .background(.blue)
        
        // MARK: - Real world page layout using spacers
        
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
    //                .font(.title)
                Spacer()
                    .frame(height: 10)
                Image(systemName: "gear")
    //                .font(.title)

            }
            //or, to get all of the HStack content have .title size, use modifier over HStack instead of single images
            .font(.title)
            //.background(.yellow)
            .padding(.horizontal)
//            .background(.blue)
            
            Spacer()
                .frame(width: 10)
            
            Rectangle()
                .frame(height: 55)
        }
        ///.background(.yellow)

    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
