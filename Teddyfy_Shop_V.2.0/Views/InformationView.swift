//
//  InformationView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct InformationView: View {
    let test = ""
    let textTest:String = "Teddyfy es una empresa dedicada a crear peluches únicos y personalizados que capturan los sentimientos y la imaginación de nuestros clientes. Deesde personajes diseñados por los usuarios hasta recreaciones de mascotas o recuerdos especiales, nuestros peluches son piezas hechas con amor, detalle y creatividad."
    let textMision:String = "Crear peluches personalizados de alta calidad que reflejen los sentimiento, historias y sueños de nuestros clientes, combinandotecnología, diseño artesanal y atención al detalle para entregar productos que conmueven y acompañen toda la vida."
    let textVision:String = "Ser la marca Líder en peluches personalizados en latinoamérica y el mundo, inspirando momentos de felicidad, nostalgia y amor en cada creación."
    let textValores:String = "Creatividad: impulsamos la imaginación en cada peluche que fabricamos."
    let textValores1:String = "Calidad: Nos comprometemos con los mejores materiales y procesos."
    let textValores2:String = "Empatía: Escuchamos y entendemo las emociones detrás de cada pedido."
    let textValores3:String = "Innovación: Utilizamos tecnología de punta para personalizar de manera única."
    let textValores4:String = "Compromiso: Cada peluche es fabricado con dedicación y responsabilidad."
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCPink]), startPoint: .topLeading, endPoint: .bottomTrailing)
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
                                .cornerRadius(32)
                                .shadow(radius: 2,x:1,y:2)
                        }
                            
//                        Image("icon_TeddyfyText")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 250)
//                            .opacity(0.3)
                        
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
                        Text(textMision)
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
                        Text(textVision)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.gray)
                        
                        
                        
                        
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
                        Text(textValores)
                            .multilineTextAlignment(.leading)
                        Text(textValores1)
                            .multilineTextAlignment(.leading)
                        Text(textValores2)
                            .multilineTextAlignment(.leading)
                        Text(textValores3)
                            .multilineTextAlignment(.leading)
                        Text(textValores4)
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
