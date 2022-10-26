//
//  ImageView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/24/22.
//

import SwiftUI

struct ImageView: View {
    @StateObject var loader:ImageViewModel
    
    init(url:String,key:String){
        _loader = StateObject(wrappedValue: ImageViewModel(url: url,key: key))
    }
   
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            }else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

//
//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView(url: "slide2", key: "1")
//    }
//}
