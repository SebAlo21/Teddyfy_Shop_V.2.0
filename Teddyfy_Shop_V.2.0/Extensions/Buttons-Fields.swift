//
//  Buttons-Fields.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 9/06/25.
//

import Foundation
import SwiftUI

extension TextField{
    func textFielBasic() -> some View{
        self.padding()
            .background(Color("user_C_White"))
            .cornerRadius(16)
            .shadow(color: .gray, radius: 0.5,x:1,y:1)
    }
}


extension SecureField{
    func secureFieldBasic() -> some View {
    self.padding()
        .background(Color("user_C_White"))
        .cornerRadius(16)
        .shadow(color: .gray, radius: 0.5,x:1,y:1)
    }
}


    //BUttons Rectangle

extension Rectangle{
    func rectangleButtonBlack()->some View{
        self.cornerRadius(16)
            .frame(width: 300,height: 60)
            .foregroundStyle(Color("user_C_Black"))
    }
    func rectangleButtonOrange()-> some View{
        self.cornerRadius(16)
            .frame(width: 300,height: 60)
            .foregroundStyle(Color("user_C_Orange"))
    }
    
    
    func rectangleLogoWhite() -> some View{
        self.cornerRadius(16)
            .frame(width: 60,height: 60)
            .foregroundStyle(Color("user_C_White"))
    }
    
    
    
    func rectangleImageBox()-> some View {
        self.cornerRadius(8)
            .foregroundStyle(Color("user_C_Orange"))
            .frame(width: 320,height: 200)
            .shadow(color:.userCBlack, radius: 2,x:3,y:3)
    }
}
