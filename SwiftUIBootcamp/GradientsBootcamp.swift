//
//  GradientsBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 06/05/22.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.red
//                LinearGradient(
//                    gradient: Gradient(colors: [.black, .blue]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                )
//                RadialGradient(
//                    colors: [Color(#colorLiteral(red: 0.3824585378, green: 0.8036194444, blue: 0.9943388104, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))],
//                    center: .leading,
//                    startRadius: 5,
//                    endRadius: 200
//                )
                AngularGradient(
                    colors: [Color(#colorLiteral(red: 0.3824585378, green: 0.8036194444, blue: 0.9943388104, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))],
                    center: .topLeading,
                    angle: .degrees(180 + 45)
                )
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBootcamp()
    }
}
