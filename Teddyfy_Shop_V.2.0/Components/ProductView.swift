//
//  ProductView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 14/05/25.
//

import SwiftUI
import CoreData

struct ProductView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject var carritoViewModel = CarritoViewModel.shared
    
    let nombre:String
    let precio:Float
    let cantidad:Int
    let imageName:String
    let color:String
    let accesorio:String
    let talla:String
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color("user_C_Pink"))
            .frame(width:320,height: 180)
            .overlay{
                HStack{
                    VStack{
                        AsyncImage(url:URL(string:imageName)){image in
                            image
                                .image?
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                        }
                    }.padding(.horizontal,10)
                    VStack(alignment: .leading){
                        HStack{
                            Text(nombre)
                                .bold()
                            Spacer()
                            Button(action:{}
                                
                            ,label:{
                                Image(systemName: "trash")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("user_C_Orange2"))
                            })
                            
                        }.padding(.horizontal,5)
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Text("Color: ")
                                    .foregroundStyle(Color.gray)
                                Text(color)
                            }
                            HStack{
                                Text("Talla: ")
                                    .foregroundStyle(Color.gray)
                                Text(talla)
                            }
                            HStack{
                                Text("Accesorio: ")
                                    .foregroundStyle(Color.gray)
                                Text(accesorio)
                            }
                        }.foregroundStyle(.gray)
                        Spacer()
                        HStack{
                            Text("S/ \(String(format:"%.2f",precio))")
                                .bold()
                            Spacer()
                            Text(String(cantidad))
                        }
                        
                    }.padding(.horizontal,5)
                        .padding(.vertical,5)
                    
                }
                .padding(10)
            }.padding(5)
            


    }
}

//#Preview {
//    ProductView(nombre: "Oso ", precio: 24.00, cantidad: 1, imageName: "https://res.cloudinary.com/sasadev/image/upload/v1749443279/oso_vaquero-sf_vphjt4.png" )
//}
