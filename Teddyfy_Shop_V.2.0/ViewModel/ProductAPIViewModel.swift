//
//  ProductAPIViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
import SwiftUI

class ProductAPIViewModel:ObservableObject{
    @Published var productos: [ProductoModel] = []
    func fetchProductos(){
        guard let url = URL(string:"https://teddyfyapi-production.up.railway.app/api/productos")else { return }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            if let data = data {
                do{
                    let productos = try JSONDecoder().decode([ProductoModel].self,from:data)
                    DispatchQueue.main.async{
                        self.productos = productos
                    }
                } catch{
                    print("Error \(error)")
                }
            }else if let error = error {
                print("Error \(error)")
            }
        }.resume()
        
    }
}
