//
//  SplashView.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 5/05/25.
//

import SwiftUI

struct SplashView: View {
    @State private var mostarStartView:Bool = false
    @State private var mostrarSheet:Bool = false
    var body: some View {
        ZStack{
            //Color("user_C_Orange")
               // .edgesIgnoringSafeArea(.all)
           // LinearGradient(gradient: Gradient(colors: [.userCPink,.userCPink]), startPoint: .topLeading, endPoint: .bottomTrailing)
              //  .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.userCPink,.userCWhite]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            RoundedRectangle(cornerRadius: 28)
                .frame(width: 160,height: 160)
                .foregroundColor(Color("user_C_Black"))
                .shadow(radius: 20)
                
            Button(action:{
                mostarStartView.toggle()
            },label:{
                Image("user_I_logoMain")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
            })
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                mostrarSheet.toggle()
            }
        }
        .sheet(isPresented: $mostrarSheet, content: {
            Start2View()
        })
        .fullScreenCover(isPresented: $mostarStartView, content:{
            LoginView()
        })
        }
    }


#Preview {
    SplashView()
}
