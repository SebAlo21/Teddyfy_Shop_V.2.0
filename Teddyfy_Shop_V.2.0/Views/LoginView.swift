//
//  LoginView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 5/05/25.
//

import SwiftUI
import CoreData


struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    
    @State private var email:String = ""
    @State private var password:String = ""
    
    @State private var mostrarInicioView:Bool = false
    @State private var mostrarRegisterView:Bool = false
    
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                HStack{
                    VStack{
                        Text("Titulo")
                        Text("Subtitulo")
                    }
                    AsyncImage(url: URL(string: "https://res.cloudinary.com/sasadev/image/upload/v1752119312/ososaludologin_qsjajh.png")){
                        image in
                        image.image?.resizable()
                            .scaledToFit()
                            .frame(height:300)
                    }
                    
                }.padding(.bottom,500)
                
                HStack{
                    RoundedRectangle(cornerRadius: 48)
                        .foregroundStyle(Color("user_C_White"))
                        .frame(width: .infinity,height: 570)
                        .overlay{
                            VStack(alignment: .center){
                                Text("Acceder")
                                    .font(.title)
                                    .bold()
                                VStack(alignment: .leading){
                                    
                                    Text("Correo")
                                        .bold()
                                    TextField("Ingrese su correo",text: $email)
                                        .textFielBasic()
                                    Spacer().frame(height: 30)
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
                                        Button(action:{},label:{
                                        Text("Olvidaste tu contraseña")
                                                .foregroundStyle(Color.gray)
                                    })
                                }
                                .padding()
                                
                                Button(action:{
                                    mostrarInicioView = usuarioViewModel.login(email,password,moc)
                                    usuarioActual = email
                                },label:{
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundStyle(Color("user_C_Orange"))
                                        .frame(width:350,height: 70)
                                        .overlay(content: {
                                            Text("ENTRAR")
                                                .tint(Color.white)
                                                .font(.title)
                                                .bold()
                                        })
                                })
                                Divider()
                                Spacer()
                                
                                //Iconos
                                HStack(spacing:20){
                                    Button(action:{
                                        
                                        
                                    },label:{
                                        Rectangle()
                                            .rectangleLogoWhite()
                                            .overlay{
                                                Image("icon_apple")
                                                    .resizable().scaledToFit()
                                                    .frame(width: 40)
                                            }
                                    })
                                   
                                    Button(action:{},label:{
                                        Rectangle()
                                            .rectangleLogoWhite()
                                            .overlay{
                                                Image("icon_Colorgoogle")
                                                    .resizable().scaledToFit()
                                                    .frame(width: 40)
                                            }
                                    })
                                    
                                }.padding(.bottom,10)
                                
                                
                                NavigationLink(destination:RegisterView()){
                                    Text("Nuevo en Teddyfy? REGISTRATE")
                                        .foregroundStyle(Color.black)
                                        .font(.system(size: 13))
                                        .bold()
                                }
                            }
                            .padding(.bottom,10)
                        }
                        
                }
                .padding(.top,200)
                
            }
            
        }
        .fullScreenCover(isPresented: $mostrarInicioView, content: {TabBarView()})
        
        
    }
    
}

#Preview {
    LoginView()
}
