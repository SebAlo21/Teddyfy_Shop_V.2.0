//
//  InformationView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct InformationView: View {
    let textTest:String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    Spacer()
                   
                    Spacer()
                        .frame(height: 20)
                    VStack(alignment:.leading){
                        Text("Informacion")
                            .bold()
                            .font(.largeTitle)
                            
                        Text("Conoce mas sobre nosotros...")
                            .bold()
                            .font(.callout)
                            .foregroundStyle(Color(.gray))
                    }
                    .padding(.trailing,30)
                    
                    
                    ZStack(){
                        AsyncImage(url: URL(string: "https://res.cloudinary.com/sasadev/image/upload/v1749353133/oso_primavera_lrqebp.jpg"))
                        {
                           image in
                            image
                                .image?.resizable()
                                .scaledToFit()
                                .frame(width: 340)
                        }
                            
                        Image("icon_TeddyfyText")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .opacity(0.3)
                        
                    }
                    
                    VStack(alignment:.leading){
                        Text("Acerca de Nosotros: ")
                            .font(.title2)
                            .bold()
                            .underline()
                        Text(textTest)
                            .multilineTextAlignment(.leading)
                        
                        
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,20)
                    
                   
                    VStack(alignment: .leading){
                        HStack(){
                            Image(systemName: "scroll")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundStyle(Color("user_C_Orange"))
                            Text("Mision")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.userCOrange)
                            Spacer()
                        }
                        Text(textTest)
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding(.horizontal,30)
                    VStack(alignment: .leading){
                        HStack(){
                            Image(systemName: "eye")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundStyle(Color("user_C_Orange"))
                            Text("Vision")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.userCOrange)
                            Spacer()
                        }
                        Text(textTest)
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        
                    }
                    .padding(.horizontal,30)
                    VStack(alignment: .leading){
                        HStack(){
                            Image(systemName: "person.3")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundStyle(Color("user_C_Orange"))
                            Text("Valores")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.userCOrange)
                            Spacer()
                        }
                        Text(textTest)
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        
                    }
                    .padding(.horizontal,30)
                    
                    
                    
                }
                
               
                
               
                
                
                
                
                
                
                
            }
        }
        
        
        
        
    }
}

#Preview {
    InformationView()
}
