//
//  RegisterView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI
import CoreData

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var nombre :String = ""
    @State private var direccion:String = ""
    @State private var telefono:String = ""
    @State private var mostrarInicioView:Bool = false
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCOrange,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                ZStack{
                    HStack{
                        VStack{
                            Text("Titulo")
                            Text("Subtitulo")
                        }
                        AsyncImage(url: URL(string: "https://res.cloudinary.com/sasadev/image/upload/v1752119334/osoregistro_jjurji.png")){
                            image in
                            image.image?.resizable()
                                .scaledToFit()
                                .frame(height:250)
                        }
                    }
                    .padding(.bottom,800)
                    //Form
                    HStack{
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundStyle(Color("user_C_White"))
                            .frame(width: 420,height: 800)
                            .overlay{
                                VStack(alignment: .center){
                                    Text("Registrarme")
                                        .font(.title)
                                        .bold()
                                    VStack(alignment: .leading){
                                        
                                        Text("Correo")
                                            .bold()
                                        TextField("Ingrese su correo",text: $email)
                                            .textFielBasic()
                                        Spacer().frame(height: 20)
                                        Text("Nombre")
                                            .bold()
                                        TextField("Ingrese su nombre",text: $nombre)
                                            .textFielBasic()
                                        Spacer().frame(height: 20)
                                        Text("Direccion")
                                            .bold()
                                        TextField("Ingrese su direccion",text: $direccion)
                                            .textFielBasic()
                                        Spacer().frame(height: 20)
                                        Text("Telefono")
                                            .bold()
                                        TextField("Ingrese su telefono",text: $telefono)
                                            .textFielBasic()
                                        Spacer().frame(height: 20)
                                        Text("Contraseña")
                                            .bold()
                                        SecureField("Ingrese su contraseña",text: $password)
                                            .secureFieldBasic()
                                        
                                    }
                                    .padding(.horizontal,20)
                                    
                                    HStack{
                                        HStack{
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(Color.gray,lineWidth: 2)
                                                .foregroundStyle(Color.white)
                                                .frame(width:20,height: 20)
                                            
                                            Text("Recordarme...")
                                                .foregroundStyle(Color.gray)
                                        }
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    Divider()
                                    Button(action:{
                                        if usuarioViewModel.registrar(email,moc){
                                            usuarioViewModel.post(email,password, nombre, direccion, telefono, moc)
                                            usuarioActual = email
                                            mostrarInicioView.toggle()
                                        } else {
                                            mostrarInicioView = false
                                        }
                                    },label:{
                                        Rectangle()
                                            .rectangleButtonOrange()
                                            .overlay(content: {
                                                Text("REGISTRAR")
                                                    .tint(Color.white)
                                                    .font(.title)
                                                    .bold()
                                            })
                                    })
                                    
                                    
                                }
                                .padding(.bottom,5)
                                .padding(.top,0)
                            }
                        
                    }
                    .padding(.top,200)
                }
            }
        }
        .fullScreenCover(isPresented: $mostrarInicioView, content: {TabBarView()})
    }
}





#Preview {
    RegisterView()
}
