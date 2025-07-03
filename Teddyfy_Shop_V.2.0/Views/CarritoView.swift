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
    
    @Environment(\.managedObjectContext) var moc
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    @StateObject var carritoViewModel = CarritoViewModel.shared
    
    @State var usuario : DBUsuario? = nil
    @State var carrito : DBCarrito? = nil
    @State  var items : [DBItemCarrito] = []
    
    
    
    @State var envio:Double = 0
    @State var descuento:Double = 0
    @State var subtotal:Double = 0
    @State private var codigo:String = ""
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    let listaProducto:[Producto] = [
        Producto(nombre: "Oso 1", precio: 22.00, cantidad: 1, imageName: "https://res.cloudinary.com/sasadev/image/upload/v1749443279/oso_vaquero-sf_vphjt4.png"),
        Producto(nombre: "Oso 2", precio: 30.00, cantidad: 1, imageName: "https://res.cloudinary.com/sasadev/image/upload/v1749352506/oso_nieve_yl9zxm.jpg"),
        Producto(nombre: "Oso 3", precio: 12.00, cantidad: 1, imageName: "https://res.cloudinary.com/sasadev/image/upload/v1749352506/oso_madera_hjmufk.jpg"),
        
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
                        .title1Black()
                    Spacer()
                    
                }
                
                //Lista de Producto
                ScrollView{
                    VStack{
                        LazyVGrid(columns: columns){
                            
                            ForEach(items){itemcarrito in
                                ProductView(nombre: itemcarrito.toProducto?.nombre ?? "", precio: itemcarrito.toProducto?.precioBase ?? 0.0, cantidad:Int( itemcarrito.cantidad), imageName: itemcarrito.toProducto?.imagenURL ?? "")
                                
                            }
                            
                            
//                            ForEach(listaProducto){ producto in
//                                ProductView(nombre: producto.nombre, precio: producto.precio, cantidad: producto.cantidad, imageName: producto.imageName)
//                            }
                        }
                    }
                }
                //Detalles de compra
                VStack(alignment: .leading){
                    Text("CODIGO PROMOCIONAL")
                        .title4Black()
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.black,lineWidth: 2)
                        .fill(Color.white)
                        .frame(width: 340,height: 40)
                        .overlay{
                            HStack{
                                TextField("Ingrese su codigo...",text: $codigo)
                                    .background(Color("user_C_White"))
                                    .frame(width:280,height: 30)
                                Image(systemName: "checkmark.seal")
                                    .renderingMode(.template)
                                    .imageBasic()
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
                        Text("S/ \(String(format:"%.2f",envio))")
                    }
                    //Descuento
                    HStack{
                        Text("Descuento")
                            .bold()
                        Spacer()
                        Text("S/ \(String(format:"%.2f",descuento))")
                    }
                    //Subtotal
                    HStack{
                        Text("Subtotal")
                            .bold()
                        Spacer()
                        Text("S/ \(String(format:"%.2f",subtotal))")
                    }
                }
                .padding(.horizontal,20)
                .padding(.top,30)
                
                
                
                //Boton de Compra
                HStack(alignment:.center){
                    Button(action:{
                        //comprar
                    },label:{
                        Rectangle()
                            .rectangleButtonOrange()
                            .overlay{
                                HStack{
                                    Text("COMPRAR")
                                        .bold()
                                    Text("(\(listaProducto.count))")
                                        .bold()
                                }
                                .foregroundStyle(Color(.white))
                            }
                    })
                   
                }.padding(.horizontal,20)
                
                
                
            }
            .padding(.horizontal,30)
        }.onAppear {
            usuario = usuarioViewModel.obtenerUsuario(usuarioActual, moc)
            carrito = usuario?.toCarrito
            if let setItems = carrito?.toItemCarrito as? Set<DBItemCarrito> {
                items = Array(setItems)
            }
        }
        }
    }


