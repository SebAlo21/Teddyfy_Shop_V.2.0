//
//  PersonalizacionViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
import CoreData

class PersonalizacionViewModel:ObservableObject{
    static let shared = PersonalizacionViewModel()
    
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
            print("Personalizacon almacenada")
        }catch{
            let nsError = error as NSError
            fatalError("Error almacenar personalizacion , \(nsError),\(nsError.userInfo)")
        }
    }
    
    //func post
    func post(_ color:String,_ talla:String,_ mensaje:String ,_ accesorio:String,_ context:NSManagedObjectContext){
        let personalizacion = DBPersonalizacion(context:context)
        personalizacion.id = UUID()
        personalizacion.color = color
        personalizacion.talla = talla
        personalizacion.mensaje = mensaje
        personalizacion.accesorio = accesorio
        save(context:context)
        
    }
    
    //func delete
    
    func delete(_ personalizacion:DBPersonalizacion,_ context:NSManagedObjectContext){
        context.delete(personalizacion)
        save(context:context)
    }
    
    
    
    
}
