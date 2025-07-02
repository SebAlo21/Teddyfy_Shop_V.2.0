//
//  TeddyfyAPIManager.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
enum TypeError:Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}


extension Data {
    func borrarData(removeString word:String)->Data?{
        let datasAsString = String(data:self,encoding: .utf8)
        let borrarDataString = datasAsString?.replacingOccurrences(of: word, with: "")
        guard let data = borrarDataString?.data(using: .utf8)else{return nil}
        return data
    }
}

class NetworkManager{
    static let shared = NetworkManager()
    static let url = "http://localhost:3000/api/productos"
    //let url = Bundle.main.url(forResource: "producto", withExtension: "json")
    init(){}
    func getListProducto(completed: @escaping(Result<[ProductoModel], TypeError>) -> Void){
        guard let url = URL(string:NetworkManager.url)
       // guard let url = url
        else{
            completed(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url){data,response,error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let data = data?.borrarData(removeString:"null,")else{
                completed(.failure(.decodingError))
                return 
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([ProductoModel].self,from:data)
                completed(.success(decodedResponse))
            } catch {
                print("")
                completed(.failure(.invalidResponse))
            }
            
        }.resume()
        
        
        
    }
}
