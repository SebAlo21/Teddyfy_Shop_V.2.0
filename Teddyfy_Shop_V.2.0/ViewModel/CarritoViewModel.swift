//
//  CarritoViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
import CoreData

class CarritoViewModel:ObservableObject{
    static let shared = CarritoViewModel()
    
    let container = NSPersistentContainer(name: "DataModel")
    init(inMemory:Bool = false){
        container.loadPersistentStores(completionHandler: {(storeDescription,error) in
            if let error = error as NSError?{
                fatalError("Error \(error), \(error.userInfo)")
            }
        })
    }
    
    //func save
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Carrito almacenado")
        }catch{
            let nsError = error as NSError
            fatalError("Error carrito no almacenado , \(nsError),\(nsError.userInfo)")
        }
    }
    
    //func post -> Creacion de CArrito(1)
    
    func post(_ usuario:DBUsuario,_ context:NSManagedObjectContext){
        
        let carrito = DBCarrito(context: context)
        carrito.id = UUID()
        carrito.toUsuario = usuario
        save(context:context)
    }
    
    //func limpiar carrito
    
    func limpiar(_ carrito:DBCarrito,_ context:NSManagedObjectContext){
        guard let items = carrito.toItemCarrito as? Set<DBItemCarrito> else{return }
        
        for item in items {
            context.delete(item)
        }
        carrito.toItemCarrito = NSSet()
        
        do{
            try context.save()
            print("Se limpio el carrito")
        } catch {
            print("No se logro limpiar el carrito ")
        }
        
    }
    
    
    
    
    //func Actualizar Carrito -> Put
    
    
    
}
