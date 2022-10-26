//
//  CoursesCatViewModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/24/22.
//

import SwiftUI
import Alamofire

class CoursesCatViewModel :ObservableObject{
    @Published var items:CoursesCatsModel?
    let prefixUrl = "https://www.sh-alialmatry.com/Project/index.php"
    
    init(){
        
    }
    
    func getAllCats(parameters:[String : Any]){
        AF.request( prefixUrl ,method: .post, parameters: parameters).response{  response in
            
            if let data = response.value {
                do {
                    if let data = data {
                     
                        let result = try JSONDecoder().decode(CoursesCatsModel.self, from: data)
                        DispatchQueue.main.async {
                            self.items  = result
                            
                        }
                    }
                    
                }catch {
                    print("some error")
                }
            }
          
        }
    }
}
