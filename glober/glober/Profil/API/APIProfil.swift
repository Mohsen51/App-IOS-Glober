//
//  APIProfil.swift
//  glober
//
//  Created by Antonin Boulnois on 16/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIProfil: ObservableObject {
    
    @EnvironmentObject var token:Token
    @Published var data:[UserProfile.Data]?
    
    func get_profil(urlparam:String){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
           
               
        let JsonBody = try! JSONSerialization.data(withJSONObject: token.token)
           
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
              
               let DecodedData = try! JSONDecoder().decode(UserProfile.self, from: data)
                
               if DecodedData.success == 1 {
                    
                    DispatchQueue.main.async {
                        self.data = DecodedData.data
                    }
                }
               
               
               
           }.resume()
       }
}
