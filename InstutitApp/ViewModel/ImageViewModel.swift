//
//  ImageViewModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/24/22.
//



import Foundation
import SwiftUI
import Combine

class ImageViewModel :ObservableObject {
    @Published var image :UIImage? = nil
    @Published var isLoading:Bool = false
    var cancellables = Set<AnyCancellable>()
    let manager = PhotoModelFileManager.instance
    
    let urlString:String
    let imageKey:String
    init(url:String, key:String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage =  manager.get(key: imageKey) {
            image = savedImage
        }else {
            downloadImage()
        }
    }
    
    func downloadImage () {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: {[weak self] (returnImage) in
                guard let self = self ,
                      let image = returnImage else { return }
                self.image = returnImage
                self.manager.add(key: self.imageKey, value: image)
                
            }
            .store(in: &cancellables)

    }
}
