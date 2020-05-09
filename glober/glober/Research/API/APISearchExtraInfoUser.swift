//
//  APISearchExtraInfoUser.swift
//  glober
//
//  Created by Antonin Boulnois on 21/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation


import SwiftUI

class APIResearchExtraInfoUser: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:FullProfil?
   
    
   
    func get_extra_info_user(userid:Int,token:String,urlparam:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
        let JsonBody = try! JSONSerialization.data(withJSONObject: ["Userid":userid] )
           
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
              
               let DecodedData = try! JSONDecoder().decode(FullProfil.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.data = DecodedData
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()
        
       }
}
