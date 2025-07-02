//
//  Teddyfy_Shop_V_2_0App.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 5/05/25.
//

import SwiftUI

@main
struct Teddyfy_Shop_V_2_0App: App {
    @StateObject var usuarioViewModel = UsuarioViewModel.shared
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(\.managedObjectContext,usuarioViewModel.container.viewContext)
        }
    }
}
