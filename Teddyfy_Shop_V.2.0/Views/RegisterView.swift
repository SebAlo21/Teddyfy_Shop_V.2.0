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
                
            }.padding(.bottom,570)
            //Form
            HStack{
                ScrollView{
                    RoundedRectangle(cornerRadius: 48)
                        .foregroundStyle(Color("user_C_White"))
                        .frame(width: .infinity,height: 800)
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
                                .padding()
                                
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
                                
                                Button(action:{
                                    if usuarioViewModel.registrar(email,moc){
                                        usuarioViewModel.post(email,password, nombre, direccion, telefono, moc)
                                        usuarioActual = email
                                        mostrarInicioView.toggle()
                                    } else {
                                        mostrarInicioView = false
                                    }
                                },label:{
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundStyle(Color("user_C_Orange"))
                                        .frame(width:350,height: 70)
                                        .overlay(content: {
                                            Text("REGISTRAR")
                                                .tint(Color.white)
                                                .font(.title)
                                                .bold()
                                        })
                                })
                                Divider()
                                Spacer()
                                
                                
                                
                            }
                            .padding(.bottom,10)
                            .padding(.top,10)
                        }
                    
                }
                
                
                .padding(.top,220)
            }
        }
        .fullScreenCover(isPresented: $mostrarInicioView, content: {TabBarView()})
    }
}





#Preview {
    RegisterView()
}
