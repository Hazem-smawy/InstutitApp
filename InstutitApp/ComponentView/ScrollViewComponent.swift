//
//  ScrollView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct ScrollViewComponent: View {
    // MARK: - Property
    @State private var showCourses:Bool = false
    @State private var isAnimating:Bool = false
    @State private var cid:String = ""
    // MARK: - Body
    var items:CoursesCatsModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 15){
                ForEach(items.data,id: \.self) {cat in
                    ImageView(url: cat.img, key: cat.cid)
                        .scaledToFill()
                        .frame( height: 260)
                        .cornerRadius(10)
                        .onTapGesture {
                            showCourses.toggle()
                            cid = cat.cid
                           
                        }
                        .scaleEffect(isAnimating ? 1 : 0.9)
                        .sheet(isPresented: $showCourses) {
                            CoursesView(cid:cid)
                        }
                }
                
               
                
                Button {
                    showCourses.toggle()
                } label: {
                    Spacer()
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                    Spacer()
                }
                .frame(width: 80,height: 260)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                
            }
            .onAppear {
                cid = items.data[0].cid
                withAnimation {
                    isAnimating = true
                }
            }
        }
    }
}
