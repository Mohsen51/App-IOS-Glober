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
    @Published var data:ProfilResultsExtraInfo?
   
    
    struct Encode {
        
        private var Location:String
        private var Token:String
        init(location:String,token:String)
        {
            self.Location = location
            self.Token = token
        }
    }
    
    func get_extra_info_user(urlparam:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
         
           
         /*  var request =  URLRequest(url:url)
           request.httpMethod = "GET"
                      
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
           
          URLSession.shared.dataTask(with: request){(data,response,error) in
               guard let data = data else {return}
              
               
            
                //debug
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                }
              
               let DecodedData = try! JSONDecoder().decode(ProfilResultsExtraInfo.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.data = DecodedData
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()*/
        print("it's ok")
       }
}
