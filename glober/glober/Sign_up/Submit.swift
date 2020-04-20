//
//  Submit.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}

struct Submit: View {
    
    @State var manager = APISignUp()
    @EnvironmentObject var user:User
    @State var hide = false
    
    var data:[String:Any] = [:]
   
   
   
    var body: some View {
        VStack{
            
            if !self.hide {
            Button(
                action: {
                    self.manager.send_data_sign_up(body: self.user.format_before_Json(),urlparam:"http://212.47.232.226/api/users/signUp")
                    self.hide = true
                   
            }, label: {Text("click")}
            
            )
           
            if (self.manager.errorSignUp) {
                Text("Email alreday used ! ")
            }
            }
            if self.hide{
                Connection()
            }
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit()
    }
}
