//
//  Main.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/13/22.
//

import SwiftUI

struct Main: View {
    @StateObject var items = ViewModel()
    var body: some View {
       CustomTabVarView()
           
    }
        
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            
    }
}
