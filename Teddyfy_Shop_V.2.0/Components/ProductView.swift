//
//  ProductView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 14/05/25.
//

import SwiftUI


struct ProductView: View {
    
    let nombre:String
    let precio:Double
    let cantidad:Int
    let imageName:String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Color("user_C_Pink"))
            .frame(width:320,height: 180)
            .overlay{
                HStack{
                    VStack{
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                    }.padding(.horizontal,10)
                    VStack(alignment: .leading){
                        HStack{
                            Text(nombre)
                                .bold()
                            Spacer()
                            Button(action:{},label:{
                                Image(systemName: "trash")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("user_C_Orange2"))
                            })
                            
                        }.padding(.horizontal,5)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Informacion")
                            Text("Nombre")
                            Text("Detalle")
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

#Preview {
    ProductView(nombre: "Oso ", precio: 24.00, cantidad: 1, imageName: "user_I_ososinFondo")
}
