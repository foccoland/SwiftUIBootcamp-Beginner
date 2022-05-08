//
//  ImageBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("google")
//            .renderingMode(.template)
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .scaledToFit()
//            .clipped()
            .frame(width: 300, height: 200)
            .foregroundColor(.red)
//            .cornerRadius(150)
//            .clipShape(
////                Circle()
////                RoundedRectangle()
//                Ellipse()
//            )

    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
