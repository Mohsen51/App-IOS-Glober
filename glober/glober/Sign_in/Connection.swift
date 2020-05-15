//
//  Connection.swift
//  glober
//
//  Created by Antonin Boulnois on 09/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Connection: View {
    
    @EnvironmentObject var user:User
    @EnvironmentObject var viewRoot:ViewRouter
    @ObservedObject var manager = APISignIn()
    @State private var username = ""
    @State private var password = ""
    @State var data:[String:Any] = [:]
    @State var errorMessage = false
    @State var errorSignIn = false
    
    

    
    func CheckIfFilled() -> Bool {
        if self.username == "" {
              return true
          }
              
        else if self.password == "" {
              return true
          }
          return false
      }
    
   
    var body: some View {
        ZStack{
            VStack{
                Image("LogoLetter")
                .resizable()
                .frame(width : 280.0,height : 90)
            }.offset(x: 0, y: -270);
            VStack{
                TextField("Email",text : $username)
                          .padding()
                          .roundedGrayBorder()
                
                SecureField("Password",text : $password)
                          .padding()
                          .roundedGrayBorder()
                
            }.padding(.horizontal, 10);
            VStack{
                ZStack{
                    Button(action :{
                        if self.CheckIfFilled() == false{
                            self.data = ["Email":self.username,"PasswordHash":self.password]
                            self.errorMessage = false
                            self.errorSignIn = false
                            self.manager.verify_authentification(body: self.data,urlparam:"http://212.47.232.226/api/users/SignIn"
                            ){ result in
                                self.viewRoot.page = result ? "dashbord" : "sign_in"
                                self.user.token = self.manager.token
                                
                                if result == false {
                                    self.errorSignIn = true
                                }
                            
                            }
                            
                        }
                        else{
                            self.errorMessage = true
                        }
                    }){
                        Rectangle()
                        .frame(width: 160, height: 40, alignment: .center)
                        .cornerRadius(50)
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 2)
                        )
                    }
                    Text("Sign in")

                }.offset(x: 0, y: 110)
                                    
                
            };VStack{
                if self.errorSignIn {
                    Text("Wrong credentials")
                }
            }.offset(x:0,y:150);
            
            VStack{
                if self.errorMessage {
                    Text("empty fields")
                }
            }.offset(x:0,y:150);
   
            }
        }
            
}


struct Connection_Previews: PreviewProvider {
    static var previews: some View {
        Connection()
    }
}
