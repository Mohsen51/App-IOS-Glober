//
//  Dashbord.swift
//  glober
//
//  Created by Antonin Boulnois on 20/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct Dashbord: View {
    
    @State private var selection = 0
    @EnvironmentObject var user:User
    
    var body: some View {
        VStack{
            

           TabView {
               Text("\(self.user.token)")
                 .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                  }
                Text("The content of the second view")
                .tabItem {
                    Image(systemName: "magnifyinglass.circle")
                    Text("Second Tab")
                             }
                Text("The content of the third view")
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Third Tab")
                             }
            }
        }
    }
}

struct Dashbord_Previews: PreviewProvider {
    static var previews: some View {
        Dashbord()
    }
}
