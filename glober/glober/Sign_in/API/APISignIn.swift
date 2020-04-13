//
//  APISignUp.swift
//  glober
//
//  Created by Antonin Boulnois on 13/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation


class APISignIn: ObservableObject {
    
    @ObservableObject var errorMessageEmptyFiels = false
    
    func verify_authentification(body:[String:Any],urlparam:String){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
           
               
           let JsonBody = try! JSONSerialization.data(withJSONObject: body)
           
           var request =  URLRequest(url:url)
           request.httpMethod = "POST"
           request.httpBody = JsonBody
           
           request.setValue("application/json",forHTTPHeaderField: "Content-Type")
           
           URLSession.shared.dataTask(with: request){(data,response,error) in
               guard let receiveData = data else {return}
               guard let ReceiveResponse = response else {return}
               
               if let json = try? JSONSerialization.jsonObject(with: receiveData, options: []) {
                              print(json)
                          }
              
                print(ReceiveResponse)
               
               
           }.resume()
       }
}
