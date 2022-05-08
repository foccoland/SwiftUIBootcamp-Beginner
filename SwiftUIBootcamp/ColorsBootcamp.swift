//
//  ColorsBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 05/05/22.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //Color.primary
                //Color(uiColor: .secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: .gray, radius: 20, x: 0, y: 20)
    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
            
    }
}
