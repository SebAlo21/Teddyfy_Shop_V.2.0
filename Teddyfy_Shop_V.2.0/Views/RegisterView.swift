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
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(){
                VStack(alignment:.center){
                    Text("Registrarse")
                        .title1Black()
                    Text("Lorem Ipsum is simply dummy text ")
                        .subtitleGray()
                }.padding(.horizontal)
                
                
                VStack(spacing:20){
                    TextField("Ingrese su correo",text: $email)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFielBasic()
                    
                    TextField("Ingrese su nombre",text: $nombre)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFielBasic()
                    
                    TextField("Ingrese su direccion",text: $direccion)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFielBasic()
                    
                    TextField("Ingrese su telefono",text: $telefono)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFielBasic()
                
                    SecureField("Ingrese su contraseña",text: $password)
                        .secureFieldBasic()
                }
                .padding(.horizontal,50)
                .padding(.vertical,40)
                
                
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
                        .rectangleButtonBlack()
                        .overlay{
                            Text("Registrar")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                        }
                })
                    
                Spacer()
                HStack(spacing:20){
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 60,height: 60)
                        .foregroundStyle(Color("user_C_White"))
                    
                        .overlay{
                            Image("icon_apple")
                                .resizable().scaledToFit()
                                .frame(width: 40)
                        }
                    
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 60,height: 60)
                        .foregroundStyle(Color("user_C_White"))
                        
                        .overlay{
                            Image("icon_Colorgoogle")
                                .resizable().scaledToFit()
                                .frame(width: 40)
                        }
                    
                    
                }.padding(.bottom,10)
                
                
            }
            .padding(.top,50)
        }
        .fullScreenCover(isPresented: $mostrarInicioView, content: {TabBarView()})
    }
}





#Preview {
    RegisterView()
}
