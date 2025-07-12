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
            Menu2View()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("INICIO")
                }
            NuevoView()
                .tabItem{
                    Image(systemName: "flame.fill")
                    Text("CATALOGO")
                }
            CarritoView()
                .tabItem{
                    Image(systemName: "bag.fill")
                    Text("CARRITO")
                }
            PerfilView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("PERFIL")
                }
        }
        .accentColor(Color("user_C_Orange"))
    }
}

//#Preview {
  //  TabBarView()
//}
