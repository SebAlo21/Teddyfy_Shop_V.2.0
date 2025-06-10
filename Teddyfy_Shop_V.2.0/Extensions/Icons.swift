//
//  Icons.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 9/06/25.
//

import Foundation
import SwiftUI

extension Image{
    func imageIconBlack()->some View{
        self.resizable()
            .renderingMode(.template)
            .foregroundStyle(Color.userCBlack)
            .scaledToFit()
            .frame(width: 20)

    }
    
    func imageBasic()-> some View {
        self.resizable()
            .scaledToFit()
    }
    
    func imageIconOrange()->some View{
        self.resizable()
            .renderingMode(.template)
            .foregroundStyle(Color.userCOrange)
            .scaledToFit()
            

    }
}
