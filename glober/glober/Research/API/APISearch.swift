//
//  APISearch.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIResearch: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:[ProfilResults.Data] = []
    @Published var errorLocation:Bool = false
   
    
   
    
    func get_profils_from_city(city:String,urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
           
            
        let JsonBody = try! JSONSerialization.data(withJSONObject: ["Location":city] )
           
           var request =  URLRequest(url:url)
           request.httpMethod = "POST"
           request.httpBody = JsonBody
           request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
           
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
           
          URLSession.shared.dataTask(with: request){(data,response,error) in
               guard let data = data else {return}
              
               
            
                //debug
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                }
            
            let ErrorData = try! JSONDecoder().decode( HandleCodeEroor.self, from: data)
            
            if ErrorData.code == 50 {
                 DispatchQueue.main.async {
                        self.errorLocation = true
                        completion(true)
                                       
                }
                print("error locatio")
            }
            else{
               let DecodedData = try! JSONDecoder().decode(ProfilResults.self, from: data)
               
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                       
                       
                        var data_without_uuid = DecodedData.data
                                              
                            
                        for var i in (0..<data_without_uuid.count){ data_without_uuid[i].id = UUID(); i+=1}
                            
                        self.data = data_without_uuid
                      
                        
                        completion(true)
                        
                    }
                }
            }
               
               
               
           }.resume()
        
       }
}
