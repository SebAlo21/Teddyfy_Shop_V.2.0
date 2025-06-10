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
                            .title1Black()
                        Text("Paso a pao: Tu peluche, a tu manera")
                            .subtitleGray()
                    }
                    .padding(.trailing,50)
                    Spacer()
                        .frame(height: 20)
                    //Paso 1
                    VStack(alignment:.leading){
                        Text("Paso 1")
                            .title4Black()
                        Text("Elige tu peluche favorito")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            Rectangle()
                                .rectangleImageBox()
                            Text("* Selecciona el tipo de peluche que más te gusta.")
                                .subtitle4Black()
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    //Paso 2
                    VStack(alignment:.leading){
                        Text("Paso 2")
                            .title4Black()
                        Text("Escribe un nombre o mensaje")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            Rectangle()
                                .rectangleImageBox()
                            Text("* Agrega el nombre, fecha, o frase especial que bordaremos con cariño.")
                                .subtitle4Black()
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 3
                    
                    VStack(alignment:.leading){
                        Text("Paso 3")
                            .title4Black()
                        Text("Escoge los colores")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            Rectangle()
                                .rectangleImageBox()
                            Text("* Personaliza los colores del peluche , accesorios y detalles.")
                                .subtitle4Black()
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 4
                    
                    VStack(alignment:.leading){
                        Text("Paso 4")
                            .title4Black()
                        Text("Añade detalles extra")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            Rectangle()
                                .rectangleImageBox()
                            Text("* Quieres un moñito? Un corazon bordado? Elige lo que mas ye guste!.")
                                .subtitle4Black()
                                .frame(width:300)
                        }
                    }
                    Spacer()
                        .frame(height: 20)
                    
                    //Paso 5
                    
                    VStack(alignment:.leading){
                        Text("Paso 5")
                            .title4Black()
                        Text("Listo")
                            .bold()
                            .font(.subheadline)
                        VStack(alignment: .leading){
                            Rectangle()
                                .rectangleImageBox()
                            Text("* revusa tu diseño , confirmalo y nosotros haremos el resto.")
                                .subtitle4Black()
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
