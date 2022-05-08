//
//  FrameBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 08/05/22.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            .background(.red)
            .frame(height: 100, alignment: .top)
            .background(.orange)
            .frame(width: 150)
            .background(.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.pink)
            .frame(height: 400, alignment: .bottom)
            .background(.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.yellow)
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
