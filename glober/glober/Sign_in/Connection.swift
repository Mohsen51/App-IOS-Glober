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
    @State var status = false
    

    
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
        VStack{
            TextField("Email",text : $username)
                      .padding()
                      .roundedGrayBorder()
            
            SecureField("Password",text : $password)
                      .padding()
                      .roundedGrayBorder()
            
             Button(
                action: {
                    if self.CheckIfFilled() == false{
                        self.data = ["Email":self.username,"PasswordHash":self.password]
                        self.errorMessage = false
                        self.manager.errorSignIn = false
                        self.manager.verify_authentification(body: self.data,urlparam:"http://212.47.232.226/api/users/SignIn"
                        ){ result in
                            self.viewRoot.page = result ? "dashbord" : "sign_in"
                            self.user.token = self.manager.token
                        }
                        
                    }
                    else{
                        self.errorMessage = true
                    }
                    }
                ,label: { Text("submit")}
                                  
                          
            )
            
            if self.manager.errorSignIn {
                Text("Wrong credentials")
            }
            
           
            if self.errorMessage {
                Text("empty fields")
            }
        }
    }
}

struct Connection_Previews: PreviewProvider {
    static var previews: some View {
        Connection()
    }
}
