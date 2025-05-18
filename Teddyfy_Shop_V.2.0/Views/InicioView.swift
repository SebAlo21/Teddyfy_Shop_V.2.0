//
//  InicioView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct Eventos:Identifiable{
    let id = UUID()
    let nombre:String
    let imageName:String
}
struct Inspiration:Identifiable{
    let id = UUID()
    let titulo:String
    let subtitulo:String
    let imagen:String
}



struct InicioView: View {
    let listaEventos:[Eventos] = [
        Eventos(nombre: "San Valentin",imageName: "icon_valentin"),
        Eventos(nombre: "Cumpleaños",imageName: "icon_cumple"),
        Eventos(nombre: "Navidad",imageName: "icon_navidad"),
        Eventos(nombre: "Baby Shower",imageName: "icon_baby"),
        Eventos(nombre: "Hallowen",imageName: "icon_hallowen"),
        Eventos(nombre: "Dia de la Madre",imageName: "icon_madre")
    ]
    
    let listaInspiration:[Inspiration] = [
        Inspiration(titulo: "Disfruta", subtitulo: "Recuerda Momentos Inolvidables", imagen: "user_I_osoAzul"),
        Inspiration(titulo: "Vive", subtitulo: "Los momentos mas emocionantes", imagen: "user_I_osoMaleta"),
        Inspiration(titulo:"Comparte", subtitulo:"Con los que mas quieres", imagen: "user_I_osoNino"),
        Inspiration(titulo: "Aprende", subtitulo:"Lo bueno de la vida", imagen: "user_I_osoPanda")
    ]
    
    
    @State private var mostrarInfoView:Bool = false
    @State private var mostrarTutorial:Bool = false
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        
        ZStack{
           
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                HStack(){
                    
                        Image("icon_TeddyfyText")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action:{
                                    mostrarInfoView.toggle()
                                },label:{
                                    Label("Sobre nosotros",systemImage: "questionmark")
                                })
                            }))
                    
                   
                    
                    Spacer()
                    
                    HStack(alignment: .bottom,spacing: 10){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        
                       
                            
                        
                    }
                }.padding(.horizontal,30)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .padding(.horizontal,20)
                
                ScrollView{
                   //Stack Tutorial
                    VStack(){
                        Text("Tutorial de pesonalización")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundStyle(Color("user_C_Black"))
                            .padding(.trailing,100)
                        
                        Button(action:{
                            //redireccion a Tutorial View
                            mostrarTutorial.toggle()
                        },label:{
                            RoundedRectangle(cornerRadius:10)
                                .foregroundStyle(Color("user_C_Pink"))
                                .padding(.horizontal,10)
                                .shadow(color:.userCBlack.opacity(0.3), radius: 1,x:3,y:3)
                                .overlay(content: {
                                    HStack(){
                                        Image(systemName:"figure.wave")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(Color("user_C_Orange"))
                                            .frame(width:30)
                                        
                                        VStack(alignment:.leading){
                                            Text("Te ayudamos...")
                                                .font(.title2)
                                            Text("a crear un regalo especial")
                                        }.foregroundStyle(Color("user_C_Black"))
                                            .bold()
                                            .padding(.leading,5)
                                        
                                        Spacer()
                                        Image(systemName: "play.fill")
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(Color("user_C_Orange"))
                                            .frame(width:30)
                                        
                                    }.padding(.horizontal,40)
                                }).frame(width: 380, height: 100)
                        })
                          
                        
                    }
                    //Stack Fin Tutorial
                    
                    //Stack List Eventos
                    VStack(alignment:.leading){
                        Text("Eventos")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundStyle(Color("user_C_Black"))
                        ScrollView(.horizontal){
                            LazyHGrid(rows:rows,spacing:20){
                                ForEach(listaEventos){ evento in
                                    Button(action:{},label:{
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width:150,height: 40)
                                            .foregroundStyle(Color("user_C_Orange"))
                                            .overlay{
                                                HStack{
                                                    Image(evento.imageName)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width:30)
                                                    Text(evento.nombre)
                                                        .foregroundStyle(Color("user_C_White"))
                                                        .bold()
                                                    
                                                }
                                                .padding(5)
                                            }
                                    })
                                    
                                    
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    
                    //Stack Fin List Eventos
                    
                    //Stack Nuevos
                    VStack(alignment: .leading){
                        HStack(){
                            Text("Nuevos ingresos")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundStyle(Color("user_C_Black"))
                            Spacer()
                            Button(action:{
                                //redireccion a NuevosView
                            },label:{
                                Text("Ver mas")
                                    .bold()
                                    .foregroundStyle(.blue)
                            })
                            
                        }
                        
                        HStack(){
                                CardView(nombre: "Oso Basico", imagenName: "user_I_ososinFondo", size:"L", precio: 35, ratio: 2.3)
                            Spacer()
                                CardView(nombre: "Oso basico 2", imagenName: "user_I_ososinFondo", size: "L", precio: 25, ratio: 2.3)
                                
                        }.padding(.horizontal,5)
                        
                        
                    }.padding(.horizontal,15)
                    //Stack Fin Nuevos
                    
                    
                    //Stack Inspiarte
                    VStack(alignment: .leading){
                        Text("Inspirate")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundStyle(Color("user_C_Black"))
                        ScrollView(.horizontal){
                            LazyHGrid(rows:rows){
                                ForEach(listaInspiration){
                                    inspiration in
                                    InspirationView(title: inspiration.titulo, subtitle: inspiration.subtitulo, imagenName: inspiration.imagen)
                                }
                            }
                        }
                        
                        
                       
                    }.padding(.horizontal,15)
                        .padding(.top,5)
                    
                    
                    //Stack Fin Inspirate
                    
                }
                .padding(.horizontal,10)
            }
            
        }
        .sheet(isPresented: $mostrarInfoView, content: {InformationView()})
        .sheet(isPresented: $mostrarTutorial, content: {TutorialView()})
       
    }
}

#Preview {
    InicioView()
}
