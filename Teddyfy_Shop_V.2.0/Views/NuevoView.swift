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
                LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCPink,.userCOrange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
               
                
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 32)
                        .fill(Color("user_C_Black"))
                        .frame(width: 402, height: 200)
                        .overlay(content: {
                            VStack(alignment: .leading){
                                Text("CATALOGO")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.userCWhite)
                                HStack{
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundStyle(Color("user_C_White"))
                                        .frame(width: 353, height: 50)
                                        .overlay(content: {
                                            
                                               
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 32)
                                                        .foregroundStyle(Color("user_C_Black"))
                                                        .frame(width:350)
                                                        .padding(.vertical,1)
                                                    HStack{
                                                        HStack{
                                                            Image(systemName: "magnifyingglass")
                                                                .renderingMode(.template)
                                                                .foregroundStyle(Color.gray)
                                                            Text("BUSCAR")
                                                                .foregroundStyle(Color.gray)
                                                        }
                                                        Spacer()
                                                        RoundedRectangle(cornerRadius: 32)
                                                            .foregroundColor(Color.userCOrange)
                                                            .frame(width:100,height: 48)
                                                            .overlay(content:{
                                                                Image(systemName:"line.3.horizontal.decrease")
                                                                    .renderingMode(.template)
                                                                    .foregroundStyle(Color.white)
                                                                
                                                            })
                                                    }
                                                }
                                                .padding(.horizontal,10)
                                            
                                        })
                                    
                                }
                                
                            }
                            
                        })
                        
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
                        
                        
                        HStack{
                            Text("*")
                                .font(.title)
                                .bold()
                                .foregroundColor(.gray)
                            Text("Productos consumidos desde Teddyfy API")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }.edgesIgnoringSafeArea(.all)
            }
        }
    }
}
    

#Preview {
    NuevoView()
}

