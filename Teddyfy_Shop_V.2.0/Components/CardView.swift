//
//  CardView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 7/05/25.
//

import SwiftUI

struct CardView: View {
    let nombre:String
    let categoria:String
    let descripcion:String
    let precioBase:Float
    let imagenURL:String
    
    
    
    
    
    var body: some View {
        
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color("user_C_White"))
                .shadow(color:Color("user_C_Black").opacity(0.5), radius: 3,x:2,y:2)
                .frame(width:165 ,height: 188)
            VStack{
                ZStack(){
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color("user_C_Pink"))
                    //.shadow(color:Color("user_C_Black").opacity(0.5), radius: 3,x:2,y:2)
                        .frame(width:154 ,height: 125)
                    AsyncImage(url:URL(string:imagenURL)){ image in
                        image
                            .image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 119,height: 116)
                    }
                    HStack(){
                        
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(Color("user_C_White").opacity(0.6))
                            .frame(width:28 ,height: 10)
                            .overlay(content: {
                                HStack(){
                                    Text(categoria)
                                        .font(.system(size: 8))
                                        .foregroundStyle(Color("user_C_Black"))
                                        .bold()
                                    Text(descripcion)
                                        .font(.system(size: 8))
                                        .foregroundStyle(Color("user_C_Black"))
                                        .bold()
                                }
                            })
                    }
                    .padding(.top,110)
                    .padding(.trailing,70)
                    
                }
                
                VStack(){
                    HStack{
                        VStack(alignment:.leading,spacing: 5){
                            Text(nombre)
                                .bold()
                                .font(.system(size: 14))
                            Text("S/ \(String(format:"%.2f",precioBase))")
                                .font(.system(size: 12))
                                .bold()
                        }.padding(.bottom,10)
                        Spacer()
                        
                        Circle()
                            .frame(width: 22)
                            .foregroundStyle(Color("user_C_Orange"))
                            .overlay(content: {
                                Image(systemName: "cross.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(Color("user_C_White"))
                                    .frame(width:12)
                            })
                    }.padding(.horizontal,5)
                        .padding(.vertical,5)
                }.frame(width: 145,height: 40)
                    .foregroundStyle(Color("user_C_Black"))
                
                
                
                
            }
            
            
        }
    }
}

