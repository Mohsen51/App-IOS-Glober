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

struct Request : Codable {
struct Data : Codable {
    let id:Int
    let UserName:String
    let email:String
    let password:String
    enum CodingKeys : String, CodingKey {
        case id
        case UserName
        case email
        case password
    }
   }
}
   

class POST : ObservableObject  {
    @Published var data:Request?
    

    var status = 1
    
    func send_data(body:Any,urlparam:String) {
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
            guard let ReceiveError = error else {return}
            
            print(ReceiveResponse)
            print(ReceiveError)
            
        }.resume()
    }
    
    func fetch_data_request(body:Any) {
        guard let url = URL(string:"http://212.47.232.226/api/users/8")else{
            return
        }
        
        var request =  URLRequest(url:url)
        request.httpMethod = "GET"
        
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            guard let receiveData = data else {return}
            
            
            let Jsoned = try! JSONDecoder().decode(Request.self, from: receiveData)
            
            DispatchQueue.main.async {
                self.data = Jsoned
            }
        }.resume()
    }
}
