//
//  CacheStorage.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/23/22.
//

/*
import SwiftUI

class CacheManager {
    static let instance = CacheManager()
    private init(){ }
    
    var imageCache:NSCache<NSString,UIImage> = {
        let cache = NSCache<NSString,UIImage>()
        cache.countLimit = 10
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image:UIImage, name:String) -> String{
        imageCache.setObject(image, forKey: name as NSString)
       return "Added to cache"
    }
    func remove(name:String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from Cache!"
    }
    func get(name:String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel:ObservableObject {
    @Published var startingImage : UIImage? = nil
    @Published var cachedImage:UIImage? = nil
    @Published var MSG:String = ""
    var imageName:String = "logo"
    let manager = CacheManager.instance
    init() {
        getImageFromAssetsFolder()
    }
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else {
            return
        }
        MSG = manager.add(image: image, name: imageName)
    }
    func removeFromCache(){
        MSG = manager.remove(name: imageName)
    }
    func getFromCache(){
        cachedImage = manager.get(name: imageName)
    }
}
*/
