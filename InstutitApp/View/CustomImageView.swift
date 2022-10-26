//
//  CustomImageView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/20/22.
//

import SwiftUI

struct CustomImageView: View {
    var urlString:String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image:UIImage = UIImage()
    var body: some View {
       Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}




class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString:String) {
        guard let url = URL(string: urlString) else { return}
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
}
