//
//  Home.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct Home: View {
    @ObservedObject var viewModel = ViewModel()
    @ObservedObject var catsViewModel = CoursesCatViewModel()
    // MARK: - Property
  
    // MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: - Sliders
                TabViewComponent(items: viewModel.items ?? defaultDataForSlideShow)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                
                // MARK: - Horizontal Scroll
                ScrollViewComponent(items: catsViewModel.items ?? defaultCatsData)
                    .frame(maxHeight: 260)
                    .padding()
                
                // MARK: - Footer
                Spacer()
                FooterView()
              
            }
            .onAppear {
                viewModel.postWithLib()
                let parameters:[String:Any] = ["action": "coursesCatGet"]
                catsViewModel.getAllCats(parameters: parameters )
            }
           
            
        }
        
        .ignoresSafeArea(.all)
        .padding(.top, 10)
        .padding(.bottom, 70)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
