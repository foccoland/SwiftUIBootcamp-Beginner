//
//  IconsBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 06/05/22.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "phone.fill.badge.plus")
            .renderingMode(.original)
            .font(.largeTitle)
//            .resizable()
//            .scaledToFit()
//            .scaledToFill()
//            .aspectRatio(contentMode: .fit)
//            .font(.caption)
//            .font(.system(size: 200))
//            .foregroundColor(.green)
//            .frame(width: 300, height: 300)
//            .clipped()

    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
