//
//  StepperBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    var body: some View {
        VStack {
            Stepper(
                "Stepper: \(stepperValue)",
                value: $stepperValue
            )
            .padding(50)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper:") {
                // increment
                incrementWidth(10)
            } onDecrement: {
                incrementWidth(-10)
            }
            .padding(50)

        }
    }
    func incrementWidth(_ amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
