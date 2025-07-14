//
//  Start2View.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct StartItem:Identifiable{
    let id = UUID()
    let titulo:String
    let parrafo:String
    let imagen:String
}


struct Start2View: View {
    @State private var mostarLoginView:Bool = false
    let items: [StartItem] = [
        StartItem(titulo:"Bienvenido ...", parrafo: "Descubre cómo dar vida a un peluche hecho a tu medida. Elige, personaliza y crea un compañero tan especial como tú.",imagen: "https://res.cloudinary.com/sasadev/image/upload/v1752119131/osocarrosel1BG_qabadd.png")
        ,StartItem(titulo: "Tú diseñas...", parrafo: "Elige entre cientos de ombinaciones, añade tu nombre , colores favoritos o dedicatorias. Creamos codad peluche con amor y detalle.",imagen: "https://res.cloudinary.com/sasadev/image/upload/v1752119271/osocarrosel2BG_mcwosp.png")
        ,StartItem(titulo: "Regala...", parrafo: "Ideal para cumpleaños , aniversarios o cualquier ocasión especial. Personaliza tu regalo y hazlo inolvidable.",imagen: "https://res.cloudinary.com/sasadev/image/upload/v1752119278/osocarrosel3BG_vd4xcr.png")
    ]
    
    
    var body: some View {
        ZStack(){
            
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .frame(height: 350)
                .foregroundStyle(Color("user_C_Pink"))
                .padding(.bottom,200)
            
            HStack(){
                Button(action:{},label:{
                    RoundedRectangle(cornerRadius: 32)
                        .foregroundStyle(Color("user_C_White"))
                        .frame(width: 100,height: 50)
                        .overlay(content: {
                            Text("atras")
                        })
                })
                Spacer()
                Button(action:{
                    mostarLoginView.toggle()
                },label:{
                    RoundedRectangle(cornerRadius: 32)
                        .foregroundStyle(Color("user_C_White"))
                        .frame(width: 100,height: 50)
                        .overlay(content: {
                            Text("saltar")
                        })
                })
            }
            .padding()
            .padding(.bottom,720)
            
            
            
            VStack(){
                TabView{
                    ForEach(items){
                        item in
                        VStack{
                            AsyncImage(url: URL(string: item.imagen)){
                                image in
                                image .image?.resizable()
                                    .scaledToFit()
                                    .frame(width:320)
                            }
                            VStack(alignment:.center){
                                Text(item.titulo)
                                    .font(.system(size: 40))
                                    .foregroundStyle(Color("user_C_Black"))
                                    .bold()
                                    .padding(.bottom,5)
                                
                                Rectangle()
                                    .cornerRadius(32)
                                    .frame(width: 350, height: 170 )
                                    .foregroundColor(.userCPink)
                                    .overlay(content: {
                                        Text(item.parrafo)
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(Color.userCBlack)
                                            .bold()
                                            .padding()
                                    })
                                    
                                
                            }
                            .padding()
                            .frame(width:350,height:200)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .padding(.top,100)
                
                //Text
                
                
                Spacer()
                
//                Button(action:{
//                    //redireccion a loginView
//                    mostarLoginView.toggle()
//                }
//                       ,label:{
//                    ZStack(alignment: .center){
//                        RoundedRectangle(cornerRadius: 48)
//                            .foregroundStyle(Color("user_C_Pink"))
//                            .frame(width:350,height: 100)
//                            .shadow(color:Color(.gray),radius: 1,x:1,y:1)
//                        ZStack(){
//                            Text("Comienza ahora...")
//                                .padding(.leading,60)
//                                .bold()
//                                .font(.title2)
//                                .foregroundStyle(Color("user_C_Black"))
//                            Circle()
//                                .foregroundStyle(Color("user_C_Orange"))
//                                .frame(width:90)
//                                .overlay(content: {
//                                    Image(systemName: "arrowshape.right.fill")
//                                        .renderingMode(.template)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width:50)
//                                        .foregroundStyle(Color("user_C_Black"))
//                                })
//                                .padding(.trailing,250)
//                          
//                      }
//                    }
//                    
//                })
                
                
                .fullScreenCover(isPresented: $mostarLoginView, content: {
                    LoginView()
                })
            }
        }
    }
}

#Preview {
    Start2View()
}
