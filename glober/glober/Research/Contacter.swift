//
//  Contacter.swift
//  glober
//
//  Created by Antonin Boulnois on 21/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Contacter: View {
    
    
    @State var manager = APIContacte()
    @EnvironmentObject var viewRoot:ViewRouter
    var userProfil:ProfilResults.Data
    var userid:Int
    var token:String
    @State var note:String = ""
    @State var isEditing = false
    
    init(data:ProfilResults.Data,userid:Int,token:String){
        self.userProfil = data
        self.userid = userid
        self.token = token
        
    }
    
    var body: some View {
        VStack{
           
            Banner( name: self.userProfil.FirstName, date: self.userProfil.DateOfBirth,country: self.userProfil.Country,gender:self.userProfil.Gender,university: self.userProfil.University ?? "")
            
            
            
            
            TextField("Note",text : $note)
            
            
            Button(
                action: { self.manager.contacte(urlparam: "http://212.47.232.226/api/users/search/profile/contact/request",idUser:self.userid, token: self.token,message:self.note){
                    result in
                    
                    if result{
                         self.viewRoot.displayContactPage = false
                    }
                    
                    }
            },
                
                label:{Text("Submit")}
            ).onDisappear(){
                 self.viewRoot.displayContactPage = false
            }
            
            if self.manager.requestAlreadySent {
                Text("Request has alreday been sent")
            }
        }
    }
}


