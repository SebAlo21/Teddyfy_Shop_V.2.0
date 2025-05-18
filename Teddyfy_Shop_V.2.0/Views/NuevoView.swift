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
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
                    
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            
                    VStack(alignment: .leading) {
                        // Título
                        Text("NUEVO")
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
                                ForEach(0..<6) { _ in
                                    ZStack(){
                                        Rectangle()
                                            .fill(Color.white.opacity(0.8))
                                            .frame(width:165,height:188)
                                            .cornerRadius(10)
                                            .shadow(color:Color("user_C_Black").opacity(0.3),radius:1,x:2,y:2)
                                        
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:100)
                                    }
                                }
                            }
                            .padding()

                            // Texto inferior
                            HStack(alignment: .top) {
                                Text("*")
                                    .font(.title)
                                    .bold()
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
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
