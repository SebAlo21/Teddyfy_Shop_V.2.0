//
//  ProductoModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation

struct ProductoModel:Codable,Hashable{
    let id :Int
    let nombre: String
    let categoria:String
    let descripcion:String
    let precioBase: Float
    let imagenURL:String
}
