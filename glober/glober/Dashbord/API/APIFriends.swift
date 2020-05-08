//
//  APIFriends.swift
//  glober
//
//  Created by Antonin Boulnois on 28/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIFriends: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:[ProfilResults.Data] = []
    @Published var contactInfo:[SocialNetwork.Data] = []
   
    
    struct Encode {
                    
                    private var UserId:Int
                    private var Token:String
                    init(userID:Int,token:String)
                    {
                        self.UserId = userID
                        self.Token = token
                    }
                }
    
    func get_social_network_info(userId:Int,urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
        let data_to_subimit = Encode(userID: userId,token: token)
          
         
            
           let JsonBody = try! JSONSerialization.data(withJSONObject: data_to_subimit )
           
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
              
               let DecodedData = try! JSONDecoder().decode(SocialNetwork.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.contactInfo = DecodedData.data
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()
       
       }
    
    func get_friends(urlparam:String,token:String,completion: @escaping(Bool) -> Void){
     
        guard let url = URL(string:urlparam)else{
                return
            }
     
       
      
         
        let JsonBody = try! JSONSerialization.data(withJSONObject: token )
        
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
           
            let DecodedData = try! JSONDecoder().decode(ProfilResults.self, from: data)
             
            if DecodedData.success == 1 {
                 
                 DispatchQueue.main.async {
                     self.data = DecodedData.data
                     completion(true)
                     
                 }
             }
            
            
            
        }.resume()
    
    }
}
