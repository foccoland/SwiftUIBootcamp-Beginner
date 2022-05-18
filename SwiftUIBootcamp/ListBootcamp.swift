//
//  ListBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 10/05/22.
//

import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits: [String] = [
        "apple",
        "orange",
        "banana",
        "peach"
    ]
    
    @State var veggies: [String] = [
        "tomato",
        "potato",
        "carrot"
    ]
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                    }
                    // you can do
    //                .onDelete { indexSet in
    //                    delete(indexSet: indexSet)
    //                }
    //                or you can shorten giving method with same sign
                    .onDelete(perform: delete)
                    
//                    moving order of the items in a list
//                    same here: you can do
                    .onMove { indexSet, newOffset in
                        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
                    }
//                    or you can shorten giving method with same sign
                    .onMove(perform: move)
                    
                    .listRowBackground(Color.orange
                        .cornerRadius(15))
                    

                } header: {
                    HStack {
                        Image(systemName: "flame.fill")
                        Text("Fruits")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                }
                
                
                Section {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized)
                    }
                } header: {
                    Text("Veggies")
                }

            }
            //.listStyle(PlainListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
//           change only color of the accent element of the list (.accentColor deprecated)
            .tint(.purple)
        }
//       change only color of the accent element outside of the list (navigation view) (.accentColor deprecated)
        .tint(.red)
    }
    
    var addButton: some View {
        Button("Add") {
            add()
        }
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
