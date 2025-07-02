//
//  PersonalizarView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 13/05/25.
//

import SwiftUI

struct Accesorio:Identifiable{
    let id : UUID = UUID()
    let imageName:String
    let nombre:String
}

struct PersonalizarView: View {
    let producto : ProductoModel
    var viewModel = ProductAPIViewModel()
    
    
    @State private var isNavigationActive = false
    
    let itemsAccesorios:[Accesorio] = [
        Accesorio(imageName: "icon_accesorios1", nombre: "Ropa"),
        Accesorio(imageName: "icon_accesorios2", nombre: "Gorra"),
        Accesorio(imageName: "icon_accesorios3", nombre: "Rosas"),
        Accesorio(imageName: "icon_accesorios4", nombre: "Globo")
        ]
    
    @State var color :String = ""
    @State var mensaje:String = ""
    @State var accesorio:String = ""
    @State var talla:String = ""
    @Environment(\.managedObjectContext) var moc
    @StateObject var itemCarritoViewModel = ItemCarritoViewModel.shared
    @StateObject var carritoViewModel = ItemCarritoViewModel.shared
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    @AppStorage("usuarioActual") var usuarioActual:String = ""
    
    @State var usuario: DBUsuario? = nil
    
    
    var body: some View {
        NavigationStack(){
            ZStack(){
                LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack(){ //contenedor img
                        VStack(alignment:.leading){
                            Text("Personalización")
                                .font(.title)
                                .bold()
                                .padding(.trailing,150)
                        }
                        
                        VStack () {
                            // Mostrar el carrusel de imágenes
                           // CarrouselView()
                            VStack(){
                                AsyncImage(url: URL(string:producto.imagenURL))
                                    
                            }
                            
                            Spacer()  // Agregar espacio debajo del carrusel
                        }
                                                
                        HStack(){ // contenedor manejadores color y tamaño
                            
                            VStack(){ //contenedor Colores
                                
                                Text("Color")
                                    .bold()
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack(){
                                    
                                    Button(action:{
                                        color = "rosa"
                                    },label:{
                                        Circle()
                                            .fill(Color.userCPink)
                                            .frame(width: 27, height: 27)
                                    })
                                    Button(action:{
                                        color = "blanco"
                                    },label:{
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 27, height: 27)
                                    })
                                    
                                    Button(action:{
                                    color = "negro"
                                    },label:{
                                        Circle()
                                            .fill(Color.userCBlack)
                                            .frame(width: 27, height: 27)
                                    })
                                    
                                    Spacer()
                                }
                            }
                            
                            VStack(){ //contenedor medidas
                                
                                HStack(){
                                    
                                    Text("Tamaños")
                                        .bold()
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                HStack(){
                                    Button(action:{
                                        talla = "S"
                                    },label:{
                                        Text("S")
                                            .font(.system(size: 22))
                                            .bold()
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                                    })
                                    
                                    Button(action:{
                                        talla = "M"
                                    },label:{
                                        Text("M")
                                            .font(.system(size: 22))
                                            .bold()
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                                    })
                                   
                                    Button(action:{
                                        talla = "L"
                                    },label:{
                                        Text("L")
                                            .font(.system(size: 22))
                                            .bold()
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                                        
                                    })
                                   
                                    Spacer()
                                    
                                }
                            }
                        } .padding(.horizontal,30)
                        
                        Spacer()
                            .frame(height:30)
                        
                        VStack(){ // contenedor de iconos Accesorios
                            
                            Text("Accesorios")
                                .bold()
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(){
                                
                                ForEach(itemsAccesorios){ item in
                                    Button(action:{
                                        accesorio = item.nombre
                                    },label:{
                                        VStack(){
                                            
                                            Image(item.imageName)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 30)
                                            
                                            Text(item.nombre)
                                                .font(.system(size: 14))
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                                .padding(.top,1)
                                            
                                        }.padding(.horizontal,15)
                                            .padding(.vertical,5)
                                    })
                                   
                                    
                                }
                                
                            }
                            
                        } .padding(.horizontal,30)
                        
                        VStack(){ //contenedor para dedicatoria
                            
                            Text("Dedicatoria")
                                .bold()
                                .font(.system(size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $mensaje, axis: .vertical)
                                .keyboardType(.default)
                                .lineLimit(5...10)
                                .textFieldStyle(.plain)
                                .frame(maxWidth: .infinity, minHeight: 120)
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 3))
                            
                            
                        }.padding(.horizontal,30)
                            .padding(.vertical,7)
                        
                        
                        // boton de añadir al carrito
                        Button (action:{
                            
                            isNavigationActive = true
                            itemCarritoViewModel.post(usuario?.toCarrito ,producto.nombre,producto.categoria,producto.descripcion,producto.precioBase,producto.imagenURL,color,mensaje,talla,1,moc)
                            //action de agregar al carrito
                        },label:{
                            Label("Añadir al carrito", systemImage:"cart.badge.plus")
                            
                                .bold()
                                .padding(.horizontal,90)
                                .padding(.vertical,30)
                                .background(Color("user_C_Orange"))
                                .foregroundStyle(.black)
                                .cornerRadius(15)
                            
                                .navigationBarTitleDisplayMode(.inline)
                        })
                        
                        
                    }
                    
                }
                .navigationDestination(isPresented: $isNavigationActive) {
                    CarritoView()
                }
            }.onAppear{
               usuario = usuarioViewModel.obtenerUsuario(usuarioActual, moc)
                
            }
        }
    }
}


