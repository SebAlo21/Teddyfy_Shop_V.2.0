//
//  ProductoViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
import CoreData

class ProductoViewModel : ObservableObject{
    static let shared = ProductoViewModel()
    
    let container = NSPersistentContainer(name: "DataModel")
    
    //Init
    init(inMemory: Bool = false){
        container.loadPersistentStores(completionHandler: {(storeDecription,error) in
            if let error = error as NSError?{
                fatalError("Error \(error), \(error.userInfo)")
            }
        })
    }
    
    //func save
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Producto almacenado")
        }catch{
            let nsError = error as NSError
            fatalError("Error almacenar Producto , \(nsError),\(nsError.userInfo)")
        }
    }
    
    //Func POST = Crear
    
    func post(_ nombre:String,_ descripcion:String,_ categoria:String,_ precioBase:Float,_ imagenURL:String,_ context:NSManagedObjectContext){
        let producto = DBProducto(context: context)
        
        producto.id = UUID()
        producto.nombre = nombre
        producto.descripcion = descripcion
        producto.categoria = categoria
        producto.precioBase = precioBase
        producto.imagenURL = imagenURL
        
        save(context: context)
    }
    
    func delete(_ producto:DBProducto,_ context:NSManagedObjectContext){
        context.delete(producto)
        save(context: context)
    }
    
    
    
    
    
}
