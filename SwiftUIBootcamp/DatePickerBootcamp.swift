//
//  DatePickerBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2020)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Selected date is:")
            Text(dateFormatter.string(from: selectedDate ).description)
                .font(.title)
            //DatePicker("Select a date", selection: $selectedDate)
            //DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.hourAndMinute])
    //        DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
            DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .foregroundColor(.orange)
                .accentColor(.orange)
                .tint(.red)
    //            .datePickerStyle(
    //                WheelDatePickerStyle()
    //            )
        }
        .background(.gray.opacity(0.3))
        .padding()
        .padding()
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
