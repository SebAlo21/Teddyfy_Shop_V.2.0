//
//  IconsView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 14/07/25.
//

import SwiftUI

struct IconsView: View {
    @Environment(\.dismiss) var dismiss
    let icons:[String] = ["basic","halloween","navidad","sanvalentin","patria"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.userCWhite,.userCPink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            //Lista de Iconos
           
            
            VStack{
                HStack{
                    Button(action:{
                        dismiss()
                    },label:{
                        Text("atras")
                            .bold()
                            .foregroundColor(.userCOrange)
                    })
                    Spacer()
                }.padding()
                Text("Seleciona ...")
                    .title1Black()
                ForEach(icons,id: \.self){
                    iconImg in
                    Button(action:{
                        switchIcon(name: iconImg)
                    },label:{
                        Image(iconImg)
                            .resizable()
                            .scaledToFit()
                            .frame(width:120)
                            .cornerRadius(16)

                    })
                    
                }
            }
            
        }
    }
   
}

func switchIcon(name:String){
    var icon:String? = name
    if name == "basic"{
        icon = nil
    }else{
        icon = "AppIcon " + (icon ?? name)
    }
    
    UIApplication.shared.setAlternateIconName(icon){error in
        guard let error else{
            return
        }
        print("Error - \(error.localizedDescription)")
    }
    
    
}




#Preview {
    IconsView()
}
