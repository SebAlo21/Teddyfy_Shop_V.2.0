//
//  CarritoView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 13/05/25.
//

import SwiftUI
import CoreData



struct CarritoView: View {
    @Environment(\.managedObjectContext) var moc
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
  
    
    @State private var refrescar:Bool = false
    
    @State private var items:[DBItemCarrito] = []
    
    @State private var carritoActual:DBCarrito?
    
    @State var envio:Double = 0
    @State var descuento:Double = 0
    @State var subtotal:Double = 0
    @State private var codigo:String = ""
    
   
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(){
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                //titulo
                HStack(){
                    Text("CARRITO")
                        .title1Black()
                    Spacer()
                }
                .padding(.horizontal,50)
                Divider()
                //Lista de Producto
                ScrollView{
                    VStack{
                        LazyVGrid(columns: columns){
                            
                            ForEach(items){itemcarrito in
                                
                                ProductView(nombre: itemcarrito.toProducto?.nombre ?? "", precio: itemcarrito.toProducto?.precioBase ?? 0.0, cantidad:Int( itemcarrito.cantidad), imageName: itemcarrito.toProducto?.imagenURL ?? "").contextMenu(ContextMenu(menuItems: {
                                    Button(action:{
                                        carritoActual?.removeFromToItemCarrito(itemcarrito)
                                        cargarData(usuarioActual)
                                    },label:{Label("Eliminar",systemImage:"trash")})
                                }))
                            }
                        }
                        
                        
                        
                    }
                    Divider()
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
                                        Text("(\(items.count))")
                                            .bold()
                                    }
                                    .foregroundStyle(Color(.white))
                                }
                        })
                        
                    }.padding(.horizontal,20)
                    
                    
                    
                }
                .padding(.horizontal,30)
                
            }
            .onAppear {
                cargarData(usuarioActual)
              
            }
            
        }
    }
        
        func cargarData(_ usuarioActual:String){
            if let carrito = usuarioViewModel.obtenerCarritoDeUsuario(usuarioActual, moc)
            {
                self.carritoActual = carrito
                self.items =  carrito.itemCarritoArray
                
            }
        }
        
    }

