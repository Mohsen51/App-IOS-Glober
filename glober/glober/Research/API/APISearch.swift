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
   
    
    struct Encode {
        
        private var Location:String
        private var Token:String
        init(location:String,token:String)
        {
            self.Location = location
            self.Token = token
        }
    }
    
    func get_profils_from_city(city:String,urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
           let data = Encode(location:city,token:token)
            /*
           let JsonBody = try! JSONSerialization.data(withJSONObject: data )
           
           var request =  URLRequest(url:url)
           request.httpMethod = "POST"
           request.httpBody = JsonBody
           
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
           
          URLSession.shared.dataTask(with: request){(data,response,error) in
               guard let data = data else {return}
               guard let ReceiveResponse = response else {return}
               
            
                //debug
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                }
              
               let DecodedData = try! JSONDecoder().decode(ProfilResults.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.data = DecodedData.data
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()*/
        print("it's ok")
       }
}
