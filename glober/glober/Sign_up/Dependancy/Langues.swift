//
//  Langues.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

func fetch_coutry() -> [String]{
    
    var countries: [String] = []

    for code in NSLocale.isoCountryCodes  {
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
        countries.append(name)
    }
    
    return countries
}


struct Langues: View {
    
    @State private var showListPicker = false
    @EnvironmentObject var user:User
    @State private var selectedCountry = 0
    
    private let countryList = fetch_coutry()
    
    var body: some View {
        VStack{
                
            Button(
                 action: {
                  withAnimation {
                   self.showListPicker.toggle()
                 
                  }
                 },
                 label: {
                   HStack(){
                        VStack(alignment: .leading){
                            Text("Languages")
                              .foregroundColor(Color(.black))
                               .font(.system(size: 15))
                            Text("\(self.countryList[selectedCountry])")
                             
                                .foregroundColor(Color(.black))
                            
                            Spacer()
                        }.padding(10)
                   
                        Spacer()
                    }
                  .modifier(CustomStyleButton())
                  
                       
                   }
               
        )
         .padding(.bottom,25)
            
    
           if self.showListPicker{
               Picker(selection: $selectedCountry, label: Text("")) {
                   ForEach(0 ..< countryList.count) {
                       Text(self.countryList[$0])

                   }
               }
           }
            
            UserLanguagesDisplay(country: self.countryList[self.selectedCountry])
                .frame(height:300)
            
        }
        
    }
}

struct Langues_Previews: PreviewProvider {
    static var previews: some View {
        Langues()
    }
}
