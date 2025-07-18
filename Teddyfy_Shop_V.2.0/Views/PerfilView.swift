//
//  PerfilView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 13/05/25.
//

import SwiftUI
import CoreData

struct Boton:Identifiable{
    let id = UUID()
    let text:String
    let icon:String
}
struct PerfilView: View {
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    @State var usuario: DBUsuario? = nil
    
    let listaBotones:[Boton] = [
        Boton(text: "Mis ordenes", icon: "list.clipboard"),
        Boton(text: "Devoluciones", icon: "return"),
        Boton(text: "Metodos de pago", icon: "creditcard"),
        Boton(text: "Notificaciones", icon: "bell"),
        Boton(text: "Carrito de Compras", icon: "cart")
        
    ]
    
    @State var cerrarSesion:Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                //Titulo
                HStack(){
                    Text("PERFIL")
                        .title1Black()
                    Spacer()
                }
                //Icono principal de perfil
                VStack{
                    VStack{
                        Circle()
                            .frame(width:150)
                            .foregroundColor(.userCPink)
                            .shadow(radius: 1,x:1,y:1)
                            .overlay(content: {
                                Image(systemName:("person"))
                                    .imageBasic()
                                    .frame(width: 70)
                            })
                        VStack(alignment: .center){
                            Text(usuario?.nombre ?? "Sin nombre")
                                .title3Black()
                            Text(usuario?.correo ?? "Sin Correo")
                                .bold()
                        }
                        
                        
                    }
                    
                }
                //Botones adicionales
                VStack{
                    ForEach(listaBotones){ boton in
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundStyle(Color("user_C_Pink"))
                            .shadow(color:.userCBlack.opacity(0.2),radius: 1,x:2,y:2)
                            .frame(width: 350,height: 70)
                            .overlay{
                                HStack{
                                    Image(systemName: boton.icon)
                                    Text(boton.text)
                                    Spacer()
                                }
                                .padding(.horizontal,20)
                            }
                    }
                }
                Spacer()
                    .frame(maxHeight:60)
                
                //Boton Cerrar Sesion
                Button(action:{
                    cerrarSesion.toggle()
                },label:{
                    HStack(alignment: .center){
                        Image(systemName: "door.left.hand.open")
                            .imageBasic()
                            .frame(width: 30)
                        Text("Cerrar Sesion")
                            .bold()
                            .font(.title2)
                    }
                    .foregroundStyle(Color("user_C_Black"))
                })
            }
            .onAppear {
                usuario = usuarioViewModel.obtenerUsuario(usuarioActual, moc)
            }
            .padding(.horizontal,30)
        }
        .fullScreenCover(isPresented: $cerrarSesion, content: {
            LoginView()
        })
    }
}
    


