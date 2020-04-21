//
//  APIContacte.swift
//  glober
//
//  Created by Antonin Boulnois on 21/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

class APIContacte: ObservableObject {
    
   
    
    func contacte(urlparam:String,idUser:Int,token:String,message:String,completion: @escaping(Bool) -> Void){
        
           guard let url = URL(string:urlparam)else{
                   return
               }
        
          
         
            /*
           let JsonBody = try! JSONSerialization.data(withJSONObject: data )
           
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
                    
                    DispatchQueue.main.async {
                        completion(true)
                        
                    }
                }
               
               
               
           }.resume()*/
        print("it's ok")
       }
}
