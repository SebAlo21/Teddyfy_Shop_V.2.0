//
//  ItemCarritoViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 1/07/25.
//

import Foundation
import CoreData


class ItemCarritoViewModel:ObservableObject{
    static let shared = ItemCarritoViewModel()
    
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
    
    //Func post -> Creacion de Item Carrito
    
    func post(_ carrito:DBCarrito?,_ nombrePro:String,_ categoriaPro:String,_ descripcionPro: String,_ precioBasePro:Float,_ imagenURLPro:String,_ colorPers:String,_ mensajePers:String,_ tallaPers:String,_ cantidadItem:Int16,_ context: NSManagedObjectContext){
        
        //creaction de producto
        let producto = DBProducto(context: context)
        producto.id = UUID()
        producto.nombre = nombrePro
        producto.categoria = categoriaPro
        producto.descripcion = descripcionPro
        producto.precioBase = precioBasePro
        producto.imagenURL = imagenURLPro
        //creacion de personalizacion
        let personalizacion = DBPersonalizacion(context: context)
        personalizacion.id = UUID()
        personalizacion.color = colorPers
        personalizacion.mensaje = mensajePers
        personalizacion.talla = tallaPers
        
        //creaccion de itemCarrito
        let itemCarrito = DBItemCarrito(context:context)
        itemCarrito.id = UUID()
        itemCarrito.cantidad = cantidadItem
        itemCarrito.fechaAgregado = Date()
        itemCarrito.precioUnitario = 20 + precioBasePro
        
        itemCarrito.toPersonalizacion = personalizacion
        itemCarrito.toProducto = producto
        carrito?.addToToItemCarrito(itemCarrito)
        itemCarrito.toCarrito = carrito
        //carrito?.toItemCarrito = (NSSet(object: itemCarrito))
        //relacion producto - itemproducto
        producto.toItemCarrito = NSSet(object:itemCarrito)
        
        //relacion personalizacion - itemcarrito
        personalizacion.toItemCarrito = itemCarrito
        
        
        save(context: context)
        
    }
    
    
    //func delete -> eliminar Item Carrito
    func delete(_ itemCarrito:DBItemCarrito,_ context:NSManagedObjectContext){
        context.delete(itemCarrito)
        save(context:context)
    }
}
