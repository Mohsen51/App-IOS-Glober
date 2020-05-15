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
            HStack{
                Banner(  name: self.userProfil.FirstName, date: self.userProfil.DateOfBirth,country: self.userProfil.Country,gender:self.userProfil.Gender,university: self.userProfil.University ?? "")
            }.offset(x:20,y:-100)
            ZStack{
                HStack{
                    Rectangle()
                        .foregroundColor(Color.white)
                    .border(Color(red: 236/255, green: 236/255, blue:236/255), width: 2)
                    .cornerRadius(10)
                        .frame(width:300,height:150)
                    .padding(5)
                }
                HStack{
                    TextField("Note",text : $note)
                        .frame(width:270,height:100)
                }
                .padding(5)
                .multilineTextAlignment(.center)
            }.offset(x:0,y:-50)
            VStack{
                ZStack{
                    Button(
                        action: { self.manager.contacte(urlparam: "http://212.47.232.226/api/users/search/profile/contact/request",idUser:self.userid, token: self.token,message:self.note){
                            result in
                            
                            if result{
                                 self.viewRoot.displayContactPage = false
                            }
                            
                            }
                    },
                        
                        label:{
                            ZStack{
                                Rectangle()
                                    .frame(width: 160, height: 40, alignment: .center)
                                    .cornerRadius(50)
                                    .foregroundColor(.blue)
                                    .overlay(
                                     RoundedRectangle(cornerRadius: 50)
                                     .stroke(Color.black, lineWidth: 2)
                                     )
                                Text("Submit")
                                .foregroundColor(Color.black)
                            }
                            
                                    
                            }
                        
                    ).onDisappear(){
                         self.viewRoot.displayContactPage = false
                    }
                    
                    if self.manager.requestAlreadySent {
                        Text("Request has alreday been sent")
                    }

                }
            }
  
        }
    }
}


