//
//  ViewModelBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 16/05/22.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    // just like @State for views,
    // @Published does the same job
    // (except the facts that does A BUNCH of other jobs)
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 8)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }

    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}


struct ViewModelBootcamp: View {
    
//    before
//    @State var fruitArray: [FruitModel] = []
    
    /*
     
     ObservedObject: using this property wrapper we can tell to this view
     that we're actually observing FruitViewModel. This way, if inside
     the viewmodel we got property that can be @Published, we can listen
     its changes inside View.
     
     The counter part of this is actually pending dependencies: every time
     view loads itself, it creates another FruitViewModel, and that
     can be bad to user performances
     
     Use this for subviews
     */
    
//    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()

    /*
     
     In way to get performance solution, we could use @StateObject
     for persist during entire lifecycle of View.
     This way there can be only ONE viewmodel, and it doesn't creates another
     instance of FruitViewModel.
     When View recreates itself, fruitViewModel simply DOES NOT. And that's good.
     
     Use this on creation / init (the first time)
     */
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()

    var body: some View {
        NavigationView {
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        RandomScreen(
                            fruitViewModel: fruitViewModel
                        )
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }

                }
            })
//            If we leave this, it creates fruit duplicates inside list everytime we dismiss
//            the first screen. Solution is inside FruitViewModel (init function): we initialize
//            list only first time inside init ONCE.
//            .onAppear {
//                fruitViewModel.getFruits()
//            }
        }
    }
}

struct RandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }

        }
    }
}

struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
//        RandomScreen()
    }
}
