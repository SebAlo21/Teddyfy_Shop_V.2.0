//
//  Menu2View.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 10/07/25.
//

import SwiftUI
import CoreData

struct Eventos:Identifiable{
    let id = UUID()
    let nombre:String
    let imageName:String
}

struct Nuevos:Identifiable{
    let id = UUID()
    let nombre:String
    let categoria:String
    let descripcion:String
    let precioBase:Float
    let imagenURL:String
}


struct Menu2View: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    @State var usuario: DBUsuario? = nil

    let listaEventos:[Eventos] = [
        Eventos(nombre: "San Valentin",imageName: "icon_valentin"),
        Eventos(nombre: "Cumpleaños",imageName: "icon_cumple"),
        Eventos(nombre: "Navidad",imageName: "icon_navidad"),
        Eventos(nombre: "Baby Shower",imageName: "icon_baby"),
        Eventos(nombre: "Hallowen",imageName: "icon_hallowen"),
        Eventos(nombre: "Dia de la Madre",imageName: "icon_madre")
    ]
    let rows = [GridItem(.flexible())]
    
    
    let listaNuevos:[Nuevos] = [
        Nuevos(nombre: "Pardo", categoria: "basico", descripcion: "Oso Pardo", precioBase: 21, imagenURL: "https://res.cloudinary.com/sasadev/image/upload/v1749446589/nuevo_TPardo_durbx1.png"),
        Nuevos(nombre: "Oso 'Te Amo'", categoria: "SanValentin", descripcion: "Oso blando m-te amo", precioBase: 30, imagenURL: "https://res.cloudinary.com/sasadev/image/upload/v1749446588/nuevo_Tlove_cnzx4m.png"),
        Nuevos(nombre: "Snoopy", categoria: "caricaturas", descripcion: "Snoppy basico", precioBase: 32, imagenURL: "https://res.cloudinary.com/sasadev/image/upload/v1749446587/nuevo_Snoopy_trn0mv.png")
    ]
    
    @State private var mostrarTutorial:Bool = false
    @State private var mostrarInformacion:Bool = false
    var body: some View {
      
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCOrange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    VStack{
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color("user_C_Black"))
                            .frame(width: 402, height: 300)
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
                                                Text(usuario?.nombre ?? "Anonimo")
                                            }.foregroundStyle(Color("user_C_White"))
                                            
                                        }
                                        Spacer()
                                        
                                        Button(action:{
                                            mostrarInformacion.toggle()
                                        },label:{
                                            Circle()
                                                .frame(width:50)
                                                .foregroundStyle(Color.gray)
                                                .overlay(content:{
                                                    Image(systemName: "info.circle.fill")
                                                        .renderingMode(.template)
                                                        .foregroundStyle(Color.white)
                                                })
                                        })
                                        
                                        
                                        
                                    }
                                    .padding()
                                    VStack{
                                        Text("¿Qué obra maestra crearemos hoy?")
                                    }.foregroundStyle(Color("user_C_White"))
                                        .frame(width:400,height: 70)
                                        .kerning(2)
                                        .font(.title)
                                        .bold()
                                        .padding(.bottom,15)
                                    
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
                        VStack(alignment:.leading){
                            VStack{
                                Button(action:{
                                    mostrarTutorial.toggle()
                                },label:{
                                    ZStack{
                                        
                                        Rectangle()
                                            .cornerRadius(32)
                                            .foregroundStyle(Color.userCWhite)
                                            .frame(width: 370,height: 140)
                                            .shadow(radius: 1,x:2,y:1)
                                            .overlay(content:{
                                                VStack(alignment: .leading){
                                                    Text("Tutorial")
                                                        .bold()
                                                        .font(.title)
                                                        .foregroundStyle(Color.userCBlack)
                                                    Text("Te ayudamos a diseñar tu proximo detalle")
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundStyle(Color.gray)
                                                        .bold()
                                                    
                                                    
                                                    Rectangle()
                                                        .cornerRadius(32)
                                                        .frame(width: 90, height: 30, alignment:.center)
                                                        .foregroundStyle(Color.userCBlack)
                                                        .overlay(content: {
                                                            Text("Vamos")
                                                                .foregroundStyle(Color.white)
                                                                .bold()
                                                                .font(.subheadline)
                                                        })
                                                    
                                                }.padding(.trailing,100)
                                            })
                                        AsyncImage(url: URL(string: "https://res.cloudinary.com/sasadev/image/upload/v1752119360/osotutorial_xcyj87.png")){
                                            image in
                                            image.image?
                                                .resizable()
                                                .frame(width:120)
                                                .padding(.leading,270)
                                            
                                        }
                                        
                                    }
                                })
                                
                            }
                            Divider()
                            
                            
                            //Tab de eventos
                            
                            VStack(alignment:.leading){
                                Text("EVENTOS")
                                    .title4Black()
                                ScrollView(.horizontal){
                                    LazyHGrid(rows:rows,spacing:20){
                                        ForEach(listaEventos){evento in
                                            
                                            Rectangle()
                                                .cornerRadius(32)
                                                .frame(width: 130, height: 50)
                                                .foregroundStyle(Color.userCPink)
                                                .shadow(radius: 0.5,x:1,y:1)
                                                .overlay(content: {
                                                    HStack{
                                                        Image(evento.imageName)
                                                            .imageBasic()
                                                            .frame(width:30)
                                                        Text(evento.nombre)
                                                            .bold()
                                                            .font(.caption)
                                                            .bold()
                                                    }
                                                })
                                            
                                        }
                                    }
                                }
                            }.padding()
                            
                            //NUevos productos
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Text("CONOCE LO NUEVO")
                                        .title4Black()
                                    Spacer()
                                    Button(action:{},label:{
                                        Text("Ver mas")
                                            .foregroundStyle(Color.gray)
                                    })
                                }
                                VStack{
                                    ScrollView(.horizontal){
                                        LazyHGrid(rows:rows,spacing: 10){
                                            ForEach(listaNuevos){nuevo in
                                                CardView(nombre: nuevo.nombre, categoria: nuevo.categoria, descripcion: nuevo.descripcion, precioBase: nuevo.precioBase, imagenURL: nuevo.imagenURL)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        .padding(.horizontal,30)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                usuario = usuarioViewModel.obtenerUsuario(usuarioActual, moc)
            }
        }
        .sheet(isPresented: $mostrarTutorial, content: {TutorialView()})
        .sheet(isPresented:$mostrarInformacion,content:{InformationView()})
    }
}

