//
//  APIImage.swift
//  glober
//
//  Created by Antonin Boulnois on 01/05/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation

class APIImage : ObservableObject  {
    
    @Published var errorSignUp:Bool = false
    @Published var completed:Bool = false
    
   
    
    func fetch_image(body:Any,urlparam:String,completion: @escaping(Bool) -> Void) {
        guard let url = URL(string:urlparam)else{
            return
        }
    
        
        let JsonBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request =  URLRequest(url:url)
        request.httpMethod = "POST"
        request.httpBody = JsonBody
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
        guard let data = data else{return }
       
      
           
        //Debug
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                       print(json)
                   }
            
        let DecodedData = try! JSONDecoder().decode(Response.self, from: data)
            
            if DecodedData.code == 10 {
                
                DispatchQueue.main.async {
                    self.errorSignUp = true
                    completion(false)
                }
            }
            else{
                DispatchQueue.main.async {
                self.completed = true
                   completion(true)
                }
            }
        }.resume()
    }
    
   
   
}
