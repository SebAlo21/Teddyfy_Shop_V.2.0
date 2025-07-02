//
//  NuevoView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 12/05/25.
//

import SwiftUI

struct NuevoView: View {
    @StateObject var viewModel = ProductAPIViewModel()
   
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        NavigationStack(){
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
                        LazyVGrid(columns: columns, spacing: 20){
                            
                            ForEach(viewModel.productos,id:\.self){producto in
                                
                                NavigationLink(destination: PersonalizarView(producto: producto)){
                                    CardView(nombre: producto.nombre, categoria: producto.categoria, descripcion: producto.descripcion, precioBase: producto.precioBase, imagenURL: producto.imagenURL)
                                }
                                    
                                
                            }
                                               
                            
                        }.onAppear{
                            viewModel.fetchProductos()
                            print(viewModel.fetchProductos())
                        }
                        
                        
                        HStack(alignment: .top) {
                            Text("*")
                                .font(.title)
                                .bold()
                            Text("Productos consumidos desde Teddyfy API")
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
}
    

#Preview {
    NuevoView()
}

