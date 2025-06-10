//
//  Text.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 9/06/25.
//

import Foundation
import SwiftUI

extension Text{
    //Title 1
    
    func title1Black() -> some View{
        self.font(.system(size: 40))
            .fontWeight(.bold)
    }
    
    //Title 2
    
    
    //Title 3
    func title3Black() -> some View{
        self.font(.title3)
            .fontWeight(.semibold)
    }
    
    
    //Title 4
    func title4Black() -> some View{
        self.font(.system(size: 20))
            .fontWeight(.semibold)
    }
    
    
    
    // Subtitle
    func subtitleGray()-> some View{
        self.font(.subheadline)
        .foregroundStyle(Color(.gray).opacity(0.9))
    }
    
    func subtitle4Black()-> some View {
        self.font(.system(size: 10))
    }
    
    
}
