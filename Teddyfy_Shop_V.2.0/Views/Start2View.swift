//
//  Start2View.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct TextItem:Identifiable{
    let id = UUID()
    let titulo:String
    let parrafo:String
}


struct Start2View: View {
    @State private var mostarLoginView:Bool = false
    let items: [TextItem] = [
        TextItem(titulo:"Bienvenido ...", parrafo: "Descubre cómo dar vida a un peluche hecho a tu medida. Elige, personaliza y crea un compañero tan especial como tú.")
        ,TextItem(titulo: "Tú diseñas...", parrafo: "Elige entre cientos de ombinaciones, añade tu nombre , colores favoritos o dedicatorias. Creamos codad peluche con amor y detalle.")
        ,TextItem(titulo: "Regala...", parrafo: "Ideal para cumpleaños , aniversarios o cualquier ocasión especial. Personaliza tu regalo y hazlo inolvidable.")
    ]
    
    
    var body: some View {
        ZStack(){
            
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(){
                ZStack{
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width:190,height: 190)
                        .foregroundStyle(Color("user_C_Black"))
                        //.shadow(color:.black,radius: 5,x:3,y:3)
                    Image("user_I_logoMain")
                        .resizable()
                        .scaledToFit()
                        .frame(width:250 ,height:250)
                        
                }
                    .padding(.top,100)
                
                TabView{
                    ForEach(items){
                        item in
                        VStack(alignment:.leading){
                            Text(item.titulo)
                                .font(.system(size: 40))
                                .foregroundStyle(Color("user_C_Black"))
                                .bold()
                                .padding(.bottom,5)
                            Text(item.parrafo)
                        }
                        .padding()
                        .frame(width:350,height:400)
                        
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                
                
                //Text
                
                
                Spacer()
                
                Button(action:{
                    //redireccion a loginView
                    mostarLoginView.toggle()
                }
                       ,label:{
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundStyle(Color("user_C_Pink"))
                            .frame(width:350,height: 100)
                            .shadow(color:Color(.gray),radius: 1,x:1,y:1)
                        ZStack(){
                            Text("Comienza ahora...")
                                .padding(.leading,60)
                                .bold()
                                .font(.title2)
                                .foregroundStyle(Color("user_C_Black"))
                            Circle()
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width:90)
                                .overlay(content: {
                                    Image(systemName: "arrowshape.right.fill")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:50)
                                        .foregroundStyle(Color("user_C_Black"))
                                })
                                .padding(.trailing,250)
                          
                      }
                    }
                    
                })
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
