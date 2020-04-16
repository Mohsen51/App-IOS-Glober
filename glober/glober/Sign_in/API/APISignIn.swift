//
//  APISignUp.swift
//  glober
//
//  Created by Antonin Boulnois on 13/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI


class APISignIn: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var errorSignIn = false
    
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
               guard let data = data else {return}
               guard let ReceiveResponse = response else {return}
               
            
                //debug
               if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                }
              
               let DecodedData = try! JSONDecoder().decode(Success.self, from: data)
                
                if DecodedData.success == 1 {
                    
                    let identifiant = try! JSONDecoder().decode(Identifiant.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.token.token = identifiant.token
                    }
                }
               
               
               
           }.resume()
       }
}
