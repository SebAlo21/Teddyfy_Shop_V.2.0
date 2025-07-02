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
                VStack(){
                    VStack(alignment:.center){
                        Text("Iniciar Sesion")
                            .title1Black()
                        Text("Lorem Ipsum is simply dummy text ")
                            .subtitleGray()
                    }.padding(.horizontal)
                    
                    VStack(spacing:20){
                        TextField("Ingrese su correo",text: $email)
                            .textFielBasic()
                            
                        SecureField("Ingrese su contraseña",text: $password)
                            .secureFieldBasic()
                    }
                    .padding(.horizontal,50)
                    .padding(.vertical,40)
                    Button(action:{
                        mostrarInicioView = usuarioViewModel.login(email,password,moc)
                        usuarioActual = email
                    },label:{
                        Rectangle()
                            .rectangleButtonBlack()
                            .overlay{
                                Text("Ingresar")
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                    })
                    Spacer()
                    
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
                .padding(.top,100)
            }
            
        }
        .fullScreenCover(isPresented: $mostrarInicioView, content: {TabBarView()})
        
        
    }
    
}

#Preview {
    LoginView()
}
