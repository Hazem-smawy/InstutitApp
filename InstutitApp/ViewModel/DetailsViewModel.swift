


import SwiftUI
import Alamofire

class DetailsViewModel :ObservableObject{
    @Published var items:DetailsModel?
    let prefixUrl = "https://www.sh-alialmatry.com/Project/index.php"
    
    init(){
        
    }
    
    func getDetails(parameters:[String : Any]){
        AF.request( prefixUrl ,method: .post, parameters: parameters).response{  response in
            
            if let data = response.value {
                do {
                    if let data = data {
                        
                        let result = try JSONDecoder().decode(DetailsModel.self, from: data)
                    
                        DispatchQueue.main.async {
                            self.items = result
                        }
                    }
                    
                }catch let error {
                    print("some error \(error)")
                }
            }
          
        }
    }
}
