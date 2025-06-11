//
//  NuevoView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 12/05/25.
//

import SwiftUI

struct NuevoView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ZStack {
                    
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            
                    VStack(alignment: .leading) {
                        // Título
                        Text("CATALOGO")
                            .font(.title)
                            .bold()
                            .padding(.horizontal)

                        // Barra de búsqueda e iconos
                        HStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                TextField("Buscar...", text: .constant(""))
                            }
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            Spacer()
                            
                            Image(systemName: "bell")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)

                        // Grid de imágenes
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446588/nuevo_TBrow_zpfcsq.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446588/nuevo_Tlove_cnzx4m.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446589/nuevo_TPardo_durbx1.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446586/nuevo_EPink_lq9kie.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446587/nuevo_Snoopy_trn0mv.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                                    CardView(nombre: "Oso Basico", imagenName: "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446586/nuevo_Freddy_dchovi.jpg?_s=public-apps", size:"L", precio: 35, ratio: 2.3)
                            }
                            .padding()

                            // Texto inferior
                            HStack(alignment: .top) {
                                Text("*")
                                    .font(.title)
                                    .bold()
                                Text("Se agregaran mas productos con la implementacion de la Base de Datos")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                }
    }
}

#Preview {
    NuevoView()
}

