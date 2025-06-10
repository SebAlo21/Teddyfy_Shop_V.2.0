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
        Inspiration(titulo: "Disfruta", subtitulo: "Recuerda Momentos Inolvidables", imagen: "https://res.cloudinary.com/sasadev/image/upload/v1749353133/oso_primavera_lrqebp.jpg"),
        Inspiration(titulo: "Vive", subtitulo: "Los momentos mas emocionantes", imagen: "https://res.cloudinary.com/sasadev/image/upload/v1749353132/oso_maleta_pmxept.jpg"),
        Inspiration(titulo:"Comparte", subtitulo:"Con los que mas quieres", imagen: "https://res.cloudinary.com/sasadev/image/upload/v1749353132/oso_ni%C3%B1o_xoumka.jpg"),
        Inspiration(titulo: "Aprende", subtitulo:"Lo bueno de la vida", imagen: "https://res.cloudinary.com/sasadev/image/upload/v1749353133/oso_panda_2_gypsmv.jpg")
    ]
    

    @State private var mostrarInfoView:Bool = false
    @State private var mostrarTutorial:Bool = false
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        
        ZStack{
           //Fondo
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            //Fin de Fondo
            VStack(){
                //Barra superior de Logo
                HStack(){
                    
                        Image("icon_TeddyfyText")
                        .imageBasic()
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
                        Button(action:{},label:{
                            Image(systemName: "magnifyingglass")
                                .imageIconBlack()
                                                    })
                        Button(action:{},label:{
                            Image(systemName: "bell")
                                .imageIconBlack()
                        })
                       
                    }
                }.padding(.horizontal,30)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .padding(.horizontal,20)
                
                //Barra superior de Logo
                Spacer()
                    .frame(maxHeight:20)
                ScrollView{
                   //Stack Tutorial
                    VStack(){
                        Text("Tutorial de pesonalización")
                            .title4Black()
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
                                            .imageIconOrange()
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
                                            .imageIconOrange()
                                            .frame(width:30)
                                        
                                    }.padding(.horizontal,40)
                                }).frame(width: 380, height: 100)
                        })
                          
                        
                    }
                    //Stack Fin Tutorial
                    Spacer()
                        .frame(minHeight:20)
                    //Stack List Eventos
                    VStack(alignment:.leading){
                        Text("Eventos")
                            .title4Black()
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
                                                        .imageBasic()
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
                    Spacer()
                        .frame(minHeight:20)
                    //Stack Nuevos
                    VStack(alignment: .leading){
                        HStack(){
                            Text("Nuevos ingresos")
                                .title4Black()
                                
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
                                CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/v1749443279/oso_vaquero-sf_vphjt4.png", size:"L", precio: 35, ratio: 2.3)
                            Spacer()
                                CardView(nombre: "Oso basico 2", imagenName: "https://res.cloudinary.com/sasadev/image/upload/v1749443279/oso_vaquero-sf_vphjt4.png", size: "L", precio: 25, ratio: 2.3)
                        }.padding(.horizontal,5)
                    }.padding(.horizontal,15)
                    //Stack Fin Nuevos
                    //Stack Inspiarte
                    VStack(alignment: .leading){
                        Text("Inspirate")
                            .title4Black()
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
