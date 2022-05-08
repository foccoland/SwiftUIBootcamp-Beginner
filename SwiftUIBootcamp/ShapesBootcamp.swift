//
//  ShapesBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 05/05/22.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule(style: .continuous)
        //Rectangle()
        RoundedRectangle(cornerRadius: 30)
            //.fill(.green)
            //.foregroundColor(.pink)
            //.stroke()
            //.stroke(.red)
            //.stroke(.red, lineWidth: 30)
            //.stroke(.orange, style: StrokeStyle(lineWidth: 30, lineCap: .square, dash: [50]))
            .trim(from: 0.4, to: 1.0)
            //.stroke(.purple, lineWidth: 50)
            .frame(width: 300, height: 200)
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
