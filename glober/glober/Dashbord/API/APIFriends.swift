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
    @Published var data:Friends?
    @Published var contactInfo:[SocialNetwork.Data] = []
    @Published var noFriends:Bool = false
    @Published var noFriendRequests:Bool = false
    @Published var noFriendsNoRequests:Bool = false
    @Published var friendOrRequest:JustFriends?
   
    
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
        
       
          
         
            
        let JsonBody = try! JSONSerialization.data(withJSONObject: ["Userid":userId] )
           
           var request =  URLRequest(url:url)
           request.httpMethod = "POST"
           request.httpBody = JsonBody
           
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
           
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
     
       
      
        
        var request =  URLRequest(url:url)
        request.httpMethod = "GET"
        
        request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
       URLSession.shared.dataTask(with: request){(data,response,error) in
            guard let data = data else {return}
           
            
         
             //debug
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
             print(json)
             }
           
        
             
            let DecodedData = try! JSONDecoder().decode(HandleCodeEroor.self, from: data)
            if (DecodedData.success == 1 && DecodedData.code == 90) {
                let dataResponse = try! JSONDecoder().decode(JustFriends.self, from: data)
                  var data_without_uuid = dataResponse
                  for var i in (0..<data_without_uuid.data.count){ data_without_uuid.data[i].id = UUID(); i+=1}
                DispatchQueue.main.async {
                    self.friendOrRequest = data_without_uuid
                  self.noFriendRequests = true
                       completion(true)
                  }
             }
            else{
                if (DecodedData.success == 1  && DecodedData.code == 91){
                  let dataResponse = try! JSONDecoder().decode(JustFriends.self, from: data)
                   var data_without_uuid = dataResponse
                   for var i in (0..<data_without_uuid.data.count){ data_without_uuid.data[i].id = UUID(); i+=1}
                    DispatchQueue.main.async {
                           self.friendOrRequest = data_without_uuid
                  self.noFriends = true
                       completion(true)
                  }
                }
                else{
                    if (DecodedData.success == 1 ){
                    
                    let dataResponse = try! JSONDecoder().decode(Friends.self, from: data)
                    DispatchQueue.main.async {
                       var data_without_uuid = dataResponse
                       for var i in (0..<data_without_uuid.Friends.count){ data_without_uuid.Friends[i].id = UUID(); i+=1}
                       
                        for var i in (0..<data_without_uuid.Requests.count){ data_without_uuid.Requests[i].id = UUID(); i+=1}
                       
                       
                           
                       self.data = data_without_uuid
                        completion(true)
                        
                    }
                }
                    else{
                        DispatchQueue.main.async {
                                        self.noFriendsNoRequests = true
                                             completion(true)
                                        }
                    }
                }
            
        }
            
            
            
        }.resume()
    
    }
}
