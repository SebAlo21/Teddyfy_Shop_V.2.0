//
//  UsuarioViewModel.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 30/06/25.
//

import Foundation
import CoreData
import CryptoKit


class UsuarioViewModel: ObservableObject{
    static let shared = UsuarioViewModel()
   
    
    let container = NSPersistentContainer(name:"DataModel")
    
    //Init
    init(inMemory:Bool = false){
        container.loadPersistentStores(completionHandler: {(storeDescription,error)in
            if let error = error as NSError?{
                fatalError("Error \(error),\(error.userInfo)")
            }
        })
    }
    
    //Save context
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
            print("Usuario almacenado")
        }catch{
            let nsError = error as NSError
            fatalError("Error almacenar Usuario , \(nsError),\(nsError.userInfo)")
        }
    }
    
    //POST -> Registrar Usuario
    
    func post(_ correo:String,_ clave:String,_ nombre:String,_ direccion:String,_ telefono:String,_ context:NSManagedObjectContext){
        
        let input = clave.data(using:.utf8)!
        let hashString = shaUser(data:input)
        
        let usuario = DBUsuario(context : context)
        usuario.id = UUID()
        usuario.correo = correo
        usuario.clave = hashString
        usuario.nombre = nombre
        usuario.direccion = direccion
        usuario.telefono = telefono
        usuario.fechaRegistro = Date()
        
        let carrito = DBCarrito(context: context)
        carrito.id = UUID()
        carrito.toUsuario = usuario
        
        usuario.toCarrito = carrito
        
        save(context: context)
        
        print(usuario.toCarrito ?? "No existe")
        
        
    }
    
    //PUT -> Actualizar Usuario
    func put(_ usuario:DBUsuario,_ correo:String,_ clave:String,_ nombre:String,_ direccion:String,_ telefono:String,_ context:NSManagedObjectContext){
        let input = clave.data(using: .utf8)!
        let hashString = shaUser(data:input)
        
        usuario.correo = correo
        usuario.clave = hashString
        usuario.nombre = nombre
        usuario.direccion = direccion
        usuario.telefono = telefono
        save(context: context)
    }
    
    //Delete -> Eliminar Usuario
    func delete(_ usuario:DBUsuario,_ context:NSManagedObjectContext){
        context.delete(usuario)
        save(context: context)
    }
    
    //Login -> Logueo de Usuario
    func login(_ correo:String,_ clave:String,_ context:NSManagedObjectContext)-> Bool {
        //ubicar el usuario
        let fetchRequest:NSFetchRequest<DBUsuario> = DBUsuario.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"correo == %@",correo)
        
        do{
            let usuarios = try context.fetch(fetchRequest)
            // comparar clave
            if let usuario = usuarios.first{
                let input = clave.data(using: .utf8)!
                let hashString = shaUser(data:input)
                if hashString == usuario.clave{
                    print("Autenticacion Exitosa")
                    return true
                }else{
                    print("Autenticacion Fallida")
                    return false
                }
            }
        } catch {
            print("Error al ubicar usuario \(error.localizedDescription)")
            return false
        }
        return false
        }
    
    func logout(){
        
    }
    // Obtener Usuario por correo
    func obtenerUsuario(_ correo:String,_ context:NSManagedObjectContext)-> DBUsuario? {
        let fetchRequest:NSFetchRequest<DBUsuario> = DBUsuario.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"correo == %@",correo)
        fetchRequest.fetchLimit = 1
        
        do{
            let resultado = try context.fetch(fetchRequest)
            return resultado.first
        } catch {
            print("Error al obtener usuario")
            return nil
        }
    }
    
    
    // validar y registrar
    func registrar(_ correo:String,_ context:NSManagedObjectContext)-> Bool{
        let fetchRequest :NSFetchRequest<DBUsuario> = DBUsuario.fetchRequest()
        fetchRequest.predicate = NSPredicate(format:"correo == %@",correo)
        
        do{
            let usuarioExistente = try context.fetch(fetchRequest)
            if usuarioExistente.isEmpty{
                return true
            } else {
                return false
            }
        } catch {
            return  false
        }
    }
    
    
    
    
    //Encriptacion de clave
    func shaUser(data : Data)->String{
        let digest = SHA256.hash(data: data)
        let hashString = digest
            .compactMap{String(format:"%02x",$0)}
            .joined()
        return hashString
    }
    
}
