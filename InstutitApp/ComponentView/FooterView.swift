//
//  FooterView.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        // MARK: - Footer
        
        HStack(alignment: .center) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width:100, alignment: .center)
//                .padding(.vertical,5)
//                .background(Color.black.opacity(0.5).clipShape(RoundedRectangle(cornerRadius: 10)))
                
            VStack(alignment: .leading, spacing: 10) {
                Text("Name Company")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                Text("all you need to learn  all courses you  need to master any thing is here..")
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                
                    
            }
           
        }
        .padding(.top, 20)
        .padding(.horizontal, 10)
        .padding(.bottom, 50)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
