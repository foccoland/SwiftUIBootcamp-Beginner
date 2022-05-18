//
//  PickerBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 13/05/22.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "Most recent"
    
    let filterOptions: [String] = [
        "Most recent", "Most popular", "Most liked"
    ]
    
    init() {
        // this type of commands (UIKit) changes appearance of ALL segmented pickers
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        // for changing text color for current selected item, use NSAttributedString
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: UISegmentedControl.State.selected)
        
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                
                Picker(
                    selection: $selection) {
                        ForEach(filterOptions.indices) { index in
                            Text(filterOptions[index])
                                .tag(filterOptions[index])
                        }
                    } label: {
                        Text("Picker")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(.purple.opacity(0.3))
                
                Spacer()
                
                Menu {
                    Picker(selection: $selection) {
        //                Text("1").tag("1")
        //                Text("2").tag("2")
        //                Text("3").tag("3")
                        ForEach(filterOptions, id: \.self) { option in
                            Label(title: {
                                Text(option)
                            }, icon: {
                                Image(systemName: "heart.fill")
                            })
                            .tag(option)
                        }
                    } label: {
                        // not working
                        HStack {
                            Text("Filter:")
                            Text(selection)
                        }
                    }
                } label: {
                    // this is working
                    HStack {
                        Text("Filter:")
                        Text(selection)
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(10)
                    .shadow(color: .orange.opacity(0.5), radius: 15, x: 0.0, y: 0.0)
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Age:")
                        Text(selection)
                    }
                    Picker(
                        selection: $selection) {
        //                    Text("1").tag("1")
        //                    Text("2").tag("2")
        //                    Text("3").tag("3")
        //                    Text("4").tag("4")
        //                    Text("5").tag("5")
        //                    Text("6").tag("6")
                            ForEach(18..<100) { n in
                                Text("\(n)")
                                    .tag("\(n)")
                                    .foregroundColor(.red)
                            }
                        } label: {

                        }
                    .pickerStyle(MenuPickerStyle())
        //            .background(.gray.opacity(0.3))

                }
                
                Spacer()
            }
            .navigationTitle("Picker bootcamp!")
            .padding()
        }
    
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
