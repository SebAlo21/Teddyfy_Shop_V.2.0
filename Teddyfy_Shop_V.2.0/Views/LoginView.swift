//
//  LoginView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 5/05/25.
//

import SwiftUI


struct LoginView: View {
    
    @State private var email:String = ""
    @State private var password:String = ""
    
    @State private var mostrarInicioView:Bool = false
    @State private var mostrarRegisterView:Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    VStack(alignment:.center){
                        Text("Iniciar Sesion")
                            .font(.system(size: 40))
                            .fontWeight(.black)
                        Text("Lorem Ipsum is simply dummy text ")
                            .foregroundStyle(Color(.gray).opacity(0.9))
                    }.padding(.horizontal)
                    
                    VStack(spacing:20){
                        TextField("Ingrese su correo",text: $email)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color("user_C_White"))
                            .cornerRadius(16)
                        
                        SecureField("Ingrese su contraseña",text: $password)
                            .padding()
                            .background(Color("user_C_White"))
                            .cornerRadius(16)
                    }
                    .padding(.horizontal,50)
                    .padding(.vertical,40)
                    Button(action:{
                        mostrarInicioView.toggle()
                    },label:{
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 300,height: 60)
                            .foregroundStyle(Color("user_C_Black"))
                            .overlay{
                                Text("Ingresar")
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
                    
                    NavigationLink(destination:RegisterView()){
                        Text("Nuevo en Teddyfy? Registrate")
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
