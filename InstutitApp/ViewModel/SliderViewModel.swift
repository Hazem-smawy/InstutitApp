//
//  SliderViewModel.swift
//  InstutitApp
//
//  Created by hazem smawy on 10/18/22.
//

import SwiftUI
import Alamofire

class ViewModel : ObservableObject {
    // MARK: - Property
    @Published var items:SlideShowModel?
    let prefixUrl = "https://www.sh-alialmatry.com/Project/index.php"
    
    // MARK: - constructor
    
    init(){
        postWithLib()
    }
    
    // MARK: - Method
    
    func postWithLib() {
        AF.request( prefixUrl ,method: .post, parameters: ["action":"slideshowGet"]).response{  response in
            
            if let data = response.value {
                do {
                    if let data = data {
                     
                        let result = try JSONDecoder().decode(SlideShowModel.self, from: data)
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
    //TODO: 1. retrieve data
    
    func fetchPosts(parameters:[String: Any]) {
        guard let url = URL(string: "\(prefixUrl)")else {
            print("Not found url")
            return
        }
//
     //let parameters:[String: Any] = ["data":["action":"slideshowGet"]]
//
     let finalData = try! JSONSerialization.data(withJSONObject: parameters)
       var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
       
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue("action", forHTTPHeaderField: "slideshowGet")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error for URLSession")
                return
            }
            do {
                if let data = data {
                 
                   print(data)
                    let result = try JSONDecoder().decode(SlideShowModel.self, from: data)
                  
                  print(result)
                }
                
            }catch let JsonError {
                print("fetch json error",JsonError.localizedDescription)
            }
        }.resume()
        
    }
    
 
    
    

}
