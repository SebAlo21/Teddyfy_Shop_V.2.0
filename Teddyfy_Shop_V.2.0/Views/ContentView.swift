//
//  ContentView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 5/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            VStack(alignment: .leading){
                Text("Bienvenido...")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(Color("user_C_Black"))
                Text("Lorem Ipsum is simply dummy text ")
                    .font(.footnote)
                    .bold()
                    .padding()
            }
            .padding(.vertical,100)
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
