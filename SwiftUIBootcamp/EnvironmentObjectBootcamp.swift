//
//  EnvironmentObjectBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 16/05/22.
//

import SwiftUI

/**
    Required: ObservedObject
    StateObject
 */

///App made for choosing between ``@EnvironmentObject`` and ``@StateObject`` / ``@ObservableObject``.
///
///
///
///If viewModel serves all views in hierarchy (i.e.: main viewmodel) ``@EnvironmentObject`` is the right choice.
///
///If viewModel serves just some screens in hierarchi (i.e. specific viewmodel) declare in the first using ``@StateObject`` and observe the same viewmodel from other views using ``@ObservedObject``.
///
///Both ways require viewModel to adopt ``ObservableObject`` protocol
///
class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}


struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { device in
                    NavigationLink {
                        DetailView(selectedItem: device)
                    } label: {
                        Text(device)
                    }

                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
    
//    we could pass viewModel to this screen,
//    but is not so perf cause we don't need it elsewhere here,
//    reason why we use EnvironmentObject
//    @ObservedObject var viewModel: EnvironmentViewModel
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // back
            Color.orange.ignoresSafeArea()
            
            // fore
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {
    
//    we could pass viewModel to third screen, but is not so perf cause we don't need it elsewhere here,
//    reason why we use EnvironmentObject
//    @ObservedObject var viewModel: EnvironmentViewModel

//    this is better, can bring to crash if we don't add environmentObject to NavigationView,
//    but we have it!
    @EnvironmentObject var viewModel: EnvironmentViewModel

    var body: some View {
        ZStack {
            // back
            LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // fore
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { device in
                        Text(device)
                    }
                }
                .foregroundColor(.white)
                .font(.title)
            }
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
//        DetailView()
//        FinalView()
    }
}
