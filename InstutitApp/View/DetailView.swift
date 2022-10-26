//
//  DetailView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/15/22.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Property
    var pid:String
    @StateObject var DVM = DetailsViewModel()
    @Environment(\.presentationMode) var isPresented

    // MARK: - Body
    var body: some View {
        
        ZStack(alignment: .top) {
      

            if let item = DVM.items {
                VStack(alignment: .leading) {
                    ImageView(url: item.data[0].img, key: item.data[0].cid)
                        .scaledToFit()
                        .frame( width:UIScreen.main.bounds.width , alignment: .center)
                        .overlay(
                            HStack {
                                Button {
                                    isPresented.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()

                            }
                            .padding()
                            .padding(.bottom, 10)
                            ,alignment: .top
                        )
                    
                    VStack(alignment: .trailing, spacing: 10) {
                        Text(item.data[0].title)
                            .font(Font.custom("Cairo-Bold", size: 22))
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                            .padding(.vertical, 15)
                            
                        
                        Text(item.data[0].content)
                            .font(Font.custom("Cairo", size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                        
                        Button {
                            //sign for course
                        } label: {
                            Text("Enroll Course")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.pink,.purple]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(10)

                    }
                    .padding()
                    
                    Spacer()
                   
                }
            } else {
                
                VStack(alignment: .center, spacing: 0) {
                    ProgressView()
                }
            }
           
            
        
        }
        .ignoresSafeArea(.all)
        .onAppear {
            let parameters:[String:Any] = ["action":"courseDetailsGet","PID":pid]
            DVM.getDetails(parameters: parameters)
           
            
        }
    }
}

