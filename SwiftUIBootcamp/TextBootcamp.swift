//
//  TextBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 05/05/22.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            //.font(.body)
            //.fontWeight(.semibold)
            //.bold()
//            .underline()
//            .italic()
//            .strikethrough()
//            .font(.system(size: 24, weight: .semibold, design: .monospaced))
            //.baselineOffset(-50.0)
            //.kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.5)
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
