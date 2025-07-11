//
//  Menu2View.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 10/07/25.
//

import SwiftUI

struct Menu2View: View {
    
    
    
    var body: some View {
      
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCOrange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    VStack{
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color("user_C_Black"))
                            .frame(width: 410, height: 300)
                            .overlay(content: {
                                VStack{
                                    HStack{
                                        HStack{
                                            Circle()
                                                .frame(width:50)
                                                .foregroundStyle(Color.gray)
                                                .overlay(content:{
                                                Image(systemName: "person")
                                                        .renderingMode(.template)
                                                        .foregroundStyle(Color.white)
                                                })
                                            VStack(alignment:.leading){
                                                Text("Bienvenido")
                                                Text("Nombre de Usuario")
                                            }.foregroundStyle(Color("user_C_White"))
                                            
                                        }
                                        Spacer()
                                        
                                        Circle()
                                            .frame(width:50)
                                            .foregroundStyle(Color.gray)
                                            .overlay(content:{
                                            Image(systemName: "bag")
                                                    .renderingMode(.template)
                                                    .foregroundStyle(Color.white)
                                            })
                                        
                                        
                                    }
                                    .padding()
                                    VStack{
                                        Text("Que obra maestra crearemos hoy?")
                                             }.foregroundStyle(Color("user_C_White"))
                                    HStack{
                                        RoundedRectangle(cornerRadius: 32)
                                            .foregroundStyle(Color("user_C_White"))
                                            .frame(width: 353, height: 50)
                                            .overlay(content: {
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 32)
                                                        .foregroundStyle(Color("user_C_Black"))
                                                        .frame(width:350)
                                                        .padding(.vertical,1)
                                                    HStack{
                                                        HStack{
                                                            Image(systemName: "magnifyingglass")
                                                                .renderingMode(.template)
                                                                .foregroundStyle(Color.gray)
                                                            Text("BUSCAR")
                                                                .foregroundStyle(Color.gray)
                                                        }
                                                        Spacer()
                                                        RoundedRectangle(cornerRadius: 32)
                                                            .foregroundColor(Color.userCOrange)
                                                            .frame(width:100,height: 48)
                                                            .overlay(content:{
                                                                Image(systemName:"line.3.horizontal.decrease")
                                                                    .renderingMode(.template)
                                                                    .foregroundStyle(Color.white)
                                                                
                                                            })
                                                    }
                                                    
                                                }
                                                .padding(.horizontal,10)
                                            })
                                                
                                    }
                                    
                                }
                                
                            })
                            
                        //Tutorial
                        
                        
                        
                        
                        
                        //Tab de eventos
                        
                        
                        
                        //NUevos productos
                    }
                    
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            
            
        }
    }
}

#Preview {
    Menu2View()
}
