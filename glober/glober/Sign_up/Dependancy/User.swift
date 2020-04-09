//
//  User.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import Foundation
import SwiftUI

struct UserCoordinates: Identifiable,Encodable {
    var id = UUID()
    var social_network:Int
    var identifiant:String
}

struct UserLanguages: Identifiable,Encodable {
    var id = UUID()
    var country:String
}

class User: ObservableObject {
    
    @Published var name:String = ""
    @Published var school:String = ""
    @Published var status:Bool = false
    @Published var email:String = ""
    @Published var gender:Int = 1
    @Published var nationality:Int = 0
    @Published var dateOfBirth:Date = Date()
    @Published var city:Int = -1
    @Published var contacts = [UserCoordinates]()
    @Published var description:String = ""
    @Published var preferences = Array(repeating: 1, count: 6)
    @Published var languages = [UserLanguages]()
    @Published var pictureUrl:String = ""
    @Published var password:String = ""
    @Published var image: UIImage?
    
    init(){
        
    }
    
    func encode_image_base64() -> String {
        let imageData:NSData = self.image!.pngData()! as NSData
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        
        return strBase64
        
    }
    
    func format_before_Json() -> [String:Any]{
        var data: [String:Any] = [:]
    
        data["username"] = self.name
        data["gender"] = self.gender
        data["university"] = self.school
        data["email"] =  self.email
        data["dateOfBirth"] = self.dateOfBirth.millisecondsSince1970
        data["description"] = self.description
        data["password"] = self.password
        data["social_media"] = fetch_social_media()
        data["about"] = self.preferences
        data["languages"] = self.fetch_languages()
        if self.image != nil{
            data["picture"] = self.encode_image_base64()
        }
        
       
        //let Jsonned = encode_json(data: data )
        return data
        
    }
    
    func fetch_social_media() -> [String:String] {
        var data: [String:String] = [:]
        let list = ["Facebook","phone", "Snapchat"]
        for contact in self.contacts{
            let name_social_media = list[contact.social_network]
            data[name_social_media] = contact.identifiant
        }
        return data
    }
    
    
    func fetch_languages() -> [String] {
        var data: [String] = []
       
        for langue in self.languages{
            data.append(langue.country)
        }
        return data
    }
    
    
    func encode_json(data:[String:Any]) -> Data{
       
        let JsonBody = try! JSONSerialization.data(withJSONObject: data)
        return JsonBody
    }
    
   
   
    
}

extension Date {
   var millisecondsSince1970:Int64 {
       return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
   }
}
