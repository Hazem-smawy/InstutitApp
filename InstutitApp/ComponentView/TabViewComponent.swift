//
//  TabViewComponent.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct TabViewComponent: View {
    var items:SlideShowModel
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State private var isAnimating:Bool = true
    @State private var currentIndex:Int = 0
    @State private var index:Int = 0
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $currentIndex) {
                    ForEach(items.data ,id:\.self) {item in
                     
                            ImageView(url: item.img, key: item.mid)
                        //ImageView(url: items.data[index].img, key: items.data[index].mid)
                        
                    }
                //ImageView(url: items.data[index].img, key: items.data[index].mid)
            
                }
               
                .overlay(
                    HStack {
                        VStack(alignment:.trailing,spacing: 5) {
                                Spacer()
                            Text(items.data[currentIndex].title)
                                .font(Font.custom("change", size: 20))
                                    .foregroundColor(.white)
                                    .offset(x: 0 , y: isAnimating ? -10: 10)
                                    .animation(.easeInOut(duration: 1), value: isAnimating)
                            Text(items.data[currentIndex].contents)
                                .font(Font.custom("change", size: 16))
                                    .foregroundColor(Color(white: 0.9))
                                    .lineLimit(2)
                                    .offset(x: 0 , y: isAnimating ? -10: 10)
                                    .animation(.easeInOut(duration: 1.5), value: isAnimating)
                            }
                            .padding(20)
                            .padding(.bottom, 25)
                            .background(.black.opacity(0.5))
                            
                       
                    }
                       
                    ,alignment: .trailing
                )
             
            .tabViewStyle(PageTabViewStyle())
            .frame( height: 300)
         
            .onReceive(timer) { _ in
                
                withAnimation {
                    
                    currentIndex = currentIndex < items.data.count - 1 ? currentIndex + 1 : 0
                   
                }
                index = currentIndex
                    
            }
            .background(.gray.opacity(0.1))
            .cornerRadius(20)
            .onAppear {
                isAnimating.toggle()
            }
            
             
        }
        .padding()
        
    }
}

//

