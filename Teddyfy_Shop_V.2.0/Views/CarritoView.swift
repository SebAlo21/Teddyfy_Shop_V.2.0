//
//  CarritoView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 13/05/25.
//

import SwiftUI

struct Producto:Identifiable{
    let id = UUID()
    let nombre:String
    let precio:Double
    let cantidad:Int
    let imageName:String
}


struct CarritoView: View {
    @State private var codigo:String = ""
    let listaProducto:[Producto] = [
        Producto(nombre: "Oso 1", precio: 22.00, cantidad: 1, imageName: "user_I_ososinFondo"),
        Producto(nombre: "Oso 2", precio: 30.00, cantidad: 1, imageName: "user_I_osoVaquero"),
        Producto(nombre: "Oso 3", precio: 12.00, cantidad: 1, imageName: "user_I_osoMadera"),
        
    ]
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack(alignment:.topLeading){
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment:.leading){
                //titulo
                HStack(){
                    Text("Carrito")
                        .bold()
                        .font(.title)
                    Spacer()
                    
                }
                
                //Lista de Producto
                ScrollView{
                    VStack{
                        LazyVGrid(columns: columns){
                            ForEach(listaProducto){ producto in
                                ProductView(nombre: producto.nombre, precio: producto.precio, cantidad: producto.cantidad, imageName: producto.imageName)
                            }
                        }
                    }
                }
                //Detalles de compra
                VStack(alignment: .leading){
                    Text("CODIGO PROMOCIONAL")
                        .bold()
                        .font(.headline)
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.black,lineWidth: 2)
                        .fill(Color.white)
                        .frame(width: 340,height: 40)
                        .overlay{
                            HStack{
                                TextField("Ingrese su codigo...",text: $codigo)
                                //.textFieldStyle(RoundedBorderTextFieldStyle())
                                    
                                    .background(Color("user_C_White"))
                                    .frame(width:280,height: 30)
                                Image(systemName: "checkmark.seal")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:20)
                                    .foregroundStyle(.green)
                            }
                            .padding(.horizontal,10)
                        }
                    
                }
                VStack{
                    //Envio
                    HStack{
                        Text("Envio")
                            .bold()
                        Spacer()
                        Text("0.00")
                    }
                    //Descuento
                    HStack{
                        Text("Descuento")
                            .bold()
                        Spacer()
                        Text("0.00")
                    }
                    //Subtotal
                    HStack{
                        Text("Subtotal")
                            .bold()
                        Spacer()
                        Text("0.00")
                    }
                }
                .padding(.horizontal,20)
                .padding(.top,30)
                
                
                
                //Boton de Compra
                HStack(alignment:.center){
                    RoundedRectangle(cornerRadius: .infinity)
                        .frame(width: 300,height: 40)
                        .foregroundStyle(Color("user_C_Orange2"))
                        .overlay{
                            HStack{
                                Text("COMPRAR")
                                    .bold()
                                Text("(\(listaProducto.count))")
                                    .bold()
                            }
                            .foregroundStyle(Color(.white))
                        }
                }
                
                
                
            }
            .padding(.horizontal,30)
        }
    }
}
#Preview {
    CarritoView()
}
