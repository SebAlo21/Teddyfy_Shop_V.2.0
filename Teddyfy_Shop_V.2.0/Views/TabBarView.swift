//
//  TabBarView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 6/05/25.
//

import SwiftUI

struct TabBarView: View {
    
    
    var body: some View {
        TabView{
            InicioView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
            NuevoView()
                .tabItem{
                    Image(systemName: "flame.fill")
                    Text("Nuevos")
                }
            //PersonalizarView()
                //.tabItem{
                    //Image(systemName: "wand.and.rays")
                  //  Text("Personalizar")
                //}
            CarritoView()
                .tabItem{
                    Image(systemName: "bag.fill")
                    Text("Carrito")
                }
            PerfilView()
                .tabItem{
                    Image(systemName: "person.circle")
                        
                    Text("Perfil")
                        
                }
          
        }
        
        .accentColor(Color("user_C_Orange"))
        
                    
            
    }
}

//#Preview {
  //  TabBarView()
//}
