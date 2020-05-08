//
//  APIProfil.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIProfil: ObservableObject {
    
   
    @Published var data:FullProfil?
  
    
    func get_profil(urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
       
       
       
           
           var request =  URLRequest(url:url)
           request.httpMethod = "GET"
           
           
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
           // Authorization Bearer token
           request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
           
           URLSession.shared.dataTask(with: request){(data,response,error) in
               
               guard let data = data else {return}
               
               
            
                //debug
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                }
              
               let DecodedData = try! JSONDecoder().decode(FullProfil.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.data = DecodedData
                        
                        completion(true)
                    }
                }
                else{
                    DispatchQueue.main.async {
                       self.data = DecodedData
                       completion(false)
                   }
         
                }
                
               
               
               
           }.resume()
       }
}
