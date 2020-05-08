//
//  APIFriendFullProfil.swift
//  glober
//
//  Created by Antonin Boulnois on 28/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIFriendFullProfil: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:[ProfilResultsExtraInfo.Data] = []
   
    struct Encode {
              
              private var UserId:Int
              private var Token:String
              init(userID:Int,token:String)
              {
                  self.UserId = userID
                  self.Token = token
              }
          }
    
    func get_friends2(userID:Int,urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
          let  data_to_be_sent = Encode(userID: userID, token: token)
         
            
           let JsonBody = try! JSONSerialization.data(withJSONObject: data_to_be_sent)
           
           var request =  URLRequest(url:url)
           request.httpMethod = "POST"
           request.httpBody = JsonBody
           
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
                        self.data = DecodedData.data
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()
       
       }
}
