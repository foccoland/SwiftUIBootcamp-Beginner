//
//  SliderBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    var body: some View {
        VStack {
            Text("Rating:")
            Text(
                //"\(sliderValue)"
                String(format: "%.1f", sliderValue)
            )
            .foregroundColor(color)
            //Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 1...5)
            //Slider(value: $sliderValue, in: 1...5, step: 0.2)
            /*
             value: $sliderValue,
             in: 1...5,
             step: 1.0,
             label: Text("Title"),
             minimumValueLabel: Text("1"),
             maximumValueLabel: Text("5"),
             onEditingChanged: { (_) in
             */
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { _ in
                    color = .green
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    // not working
                    Text("Title")
                        .font(.title)
                        .foregroundColor(.green)
                    
                }
            )
            .tint(.red)
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
