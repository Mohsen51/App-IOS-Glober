//
//  APIRequestsContact.swift
//  glober
//
//  Created by Antonin Boulnois on 28/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIRequestsContact: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:[ProfilResults.Data] = []
    
    
   

    func get_requests_contact(urlparam:String,token:String,completion: @escaping(Bool) -> Void){
        
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
    
    func get_accept_request(bool:Int,userId:Int,urlparam:String,token:String){
           
              guard let url = URL(string:urlparam)else{
                      return
                  }
           
            
       
               
        let JsonBody = try! JSONSerialization.data(withJSONObject: ["Userid":userId,"Response":bool] )
              
              var request =  URLRequest(url:url)
              request.httpMethod = "PUT"
              request.httpBody = JsonBody
              request.addValue("Bearer "+token,forHTTPHeaderField: "Authorization")
              request.setValue("application/json",forHTTPHeaderField: "Content-Type")
              
             URLSession.shared.dataTask(with: request){(data,response,error) in
                  guard let data = data else {return}
                 
                
               
                   //debug
                  if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                   print(json)
                   }
                 
                 
                  
                  
                  
              }.resume()
          
          }
}
