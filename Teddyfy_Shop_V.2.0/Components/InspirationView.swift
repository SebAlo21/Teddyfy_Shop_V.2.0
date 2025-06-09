//
//  InspirationView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 7/05/25.
//

import SwiftUI

struct InspirationView: View {
    let title:String
    let subtitle:String
    let imagenName:String
    
    var body: some View {
        
        Button(action:{
            
        },label:{
            VStack{
                ZStack{
                    AsyncImage(url:URL(string:imagenName)){ image in
                        image
                        .image?.resizable()
                        .scaledToFill()
                        .clipped()
                        .opacity(0.7)
                    }
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 50)
                            .overlay{
                            Image(systemName: "bookmark")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                                .foregroundStyle(Color("user_C_White"))
                        }
                        .padding(.leading,220)
                        .padding(.bottom,300)
                    
                    Rectangle()
                       .fill(Color.clear)
                        .frame(width: 250,height: 100)
                        .overlay{
                            VStack(alignment:.leading){
                                Text(title)
                                    .bold()
                                    .font(.title2)
                                    //.padding(.leading,10)
                                Text(subtitle)
                                    
                                    .multilineTextAlignment(.leading)
                                    
                                    .font(.system(size: 12))
                                    .bold()
                                    //.background(Color.red)
                            }.foregroundStyle(.white)
                                .padding(.trailing,70)
                                .padding(.top,10)
                        }
                        .padding(.trailing,30)
                        .padding(.top,240)
                    
                    
                }
            }
            .frame(width: 280,height: 360)
            .cornerRadius(18)
            
            .shadow(color:.black,radius: 3,x:2,y:2)
            
        })
        .padding(.top,10)
        
        
    }
}

#Preview {
    InspirationView(title: "titulo 1", subtitle: "Lorem impus sdoansd ", imagenName: "https://res.cloudinary.com/sasadev/image/upload/v1749353133/oso_primavera_lrqebp.jpg")
}
