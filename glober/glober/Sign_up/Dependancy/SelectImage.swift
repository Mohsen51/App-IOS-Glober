//
//  SelectImage.swift
//  glober
//
//  Created by Antonin Boulnois on 08/04/2020.
//  Copyright © 2020 Antonin Boulnois. All rights reserved.
//

import SwiftUI

struct SelectImage: View {
    
    @State private var inputImage: UIImage?
    @State private var displayImage: Image?
    @State private var showingImagePicker = false
    @EnvironmentObject var user:User
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.user.image = inputImage
        self.displayImage = Image(uiImage: inputImage)
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:100,height:100)
               
            
            if  self.user.image != nil {
                displayImage?
                 .resizable()
                  .frame(width:150,height:150)
                .clipShape(Circle())
                   .aspectRatio(contentMode: .fit)
                .shadow(radius: 8)
                   
            }
            else{
                Image("iu")
                .resizable()
                .scaledToFit()
                .frame(width:150,height:150)
                .clipShape(Circle())
                .shadow(radius: 8)
                .padding(.top,10)
                
            }
            
        }
        .onTapGesture {
        self.showingImagePicker = true
            }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
}

struct SelectImage_Previews: PreviewProvider {
    static var previews: some View {
        SelectImage()
    }
}
