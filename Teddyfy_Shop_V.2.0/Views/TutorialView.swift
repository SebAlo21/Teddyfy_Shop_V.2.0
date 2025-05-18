//
//  TutorialView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 12/05/25.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        ZStack{
           
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.leading){
                ScrollView(){
                    //Encabezado
                    Spacer()
                        .frame(height: 40)
                    VStack(alignment:.leading){
                        Text("Tutorial")
                            .bold()
                            .font(.largeTitle)
                            
                        Text("Paso a pao: Tu peluche, a tu manera")
                            .bold()
                            .font(.callout)
                            .foregroundStyle(Color(.gray))
                    }
                    .padding(.trailing,50)
                    Spacer()
                        .frame(height: 20)
                    //Paso 1
                    VStack(alignment:.leading){
                        Text("Paso 1")
                            .bold()
                            .font(.title3)
                        Text("Elige tu peluche favorito")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width: 320,height: 200)
                                .shadow(color:.userCBlack, radius: 2,x:3,y:3)
                            Text("* Selecciona el tipo de peluche que más te gusta.")
                                .font(.system(size: 10))
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    //Paso 2
                    VStack(alignment:.leading){
                        Text("Paso 2")
                            .bold()
                            .font(.title3)
                        Text("Escribe un nombre o mensaje")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width: 320,height: 200)
                                .shadow(color:.userCBlack, radius: 2,x:3,y:3)
                            Text("* Agrega el nombre, fecha, o frase especial que bordaremos con cariño.")
                                .font(.system(size: 10))
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 3
                    
                    VStack(alignment:.leading){
                        Text("Paso 3")
                            .bold()
                            .font(.title3)
                        Text("Escoge los colores")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width: 320,height: 200)
                                .shadow(color:.userCBlack, radius: 2,x:3,y:3)
                            Text("* Personaliza los colores del peluche , accesorios y detalles.")
                                .font(.system(size: 10))
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 4
                    
                    VStack(alignment:.leading){
                        Text("Paso 4")
                            .bold()
                            .font(.title3)
                        Text("Añade detalles extra")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width: 320,height: 200)
                                .shadow(color:.userCBlack, radius: 2,x:3,y:3)
                            Text("* Quieres un moñito? Un corazon bordado? Elige lo que mas ye guste!.")
                                .font(.system(size: 10))
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 5
                    
                    VStack(alignment:.leading){
                        Text("Paso 5")
                            .bold()
                            .font(.title3)
                        Text("Listo")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color("user_C_Orange"))
                                .frame(width: 320,height: 200)
                                .shadow(color:.userCBlack, radius: 2,x:3,y:3)
                            Text("* revusa tu diseño , confirmalo y nosotros haremos el resto.")
                                .font(.system(size: 10))
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                }
            }
        }
    }
}

#Preview {
    TutorialView()
}
