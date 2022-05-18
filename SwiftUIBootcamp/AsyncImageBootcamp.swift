//
//  AsyncImageBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Fabio Giannelli on 18/05/22.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    
    let url = URL(string: "https://picsum.photos/400")
    var body: some View {
        if #available(iOS 15.0, *) {
//            AsyncImage(url: url, content: { returnedImage in
//                returnedImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(10)
//            }, placeholder: {
//                ProgressView()
//            })
//
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                case .failure(let _):
                    Image(systemName: "questionmark")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
        } else {
            // Fallback on earlier versions
//            Group {
//                if myImage == nil {
//                    ProgressView()
//                } else {
//                    Image(uiImage: myImage!)
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
//            .task {
//                let downloadedImage = await UIImage(data: myURLRequestHere())) ?? UIImage()      // URLRequest to return data
//                DispatchQueue.main.async {
//                    withAnimation {
//                        myImage = downloadedImage
//                    }
//                }
//            }
        }
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
