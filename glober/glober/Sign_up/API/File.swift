//
//  File.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class APISignUp : ObservableObject  {
    
    @ObservableObject error_sign_up:Bool = false
    
    var status = 1
    
    func send_data_sign_up(body:Any,urlparam:String) {
        guard let url = URL(string:urlparam)else{
            return
        }
    
        
        let JsonBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request =  URLRequest(url:url)
        request.httpMethod = "POST"
        request.httpBody = JsonBody
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            
        guard let data = data else{return }
       
        guard let response = response else{return }
        print(response)
           
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                       print(json)
                   }
            
            /* DispatchQueue.main.async {
                print(data ?? "nul")
            }*/
            
        }.resume()
    }
    
    func fetch_data_request() {
        guard let url = URL(string:"http://212.47.232.226/api/users/25")else{
            return
        }
        
        var request =  URLRequest(url:url)
        request.httpMethod = "GET"
        
        
        
        URLSession.shared.dataTask(with: request,completionHandler: {(data,response,error) in
            
            guard let data = data else{return }
            print(data)
            guard let response = response else{return }
            print(response)
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
            }
            
            
            let Jsoned = try! JSONDecoder().decode(Test.self, from: data)
            print(Jsoned.response)
            DispatchQueue.main.async {
              //  self.data = Jsoned
            }
        }).resume()
    }
    
    
    
   
}
