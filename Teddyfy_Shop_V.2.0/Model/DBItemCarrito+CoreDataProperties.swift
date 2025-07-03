//
//  DBItemCarrito+CoreDataProperties.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 3/07/25.
//
//

import Foundation
import CoreData


extension DBItemCarrito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBItemCarrito> {
        return NSFetchRequest<DBItemCarrito>(entityName: "DBItemCarrito")
    }

    @NSManaged public var cantidad: Int16
    @NSManaged public var fechaAgregado: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var precioUnitario: Float
    @NSManaged public var toCarrito: DBCarrito?
    @NSManaged public var toPersonalizacion: DBPersonalizacion?
    @NSManaged public var toProducto: DBProducto?

}

extension DBItemCarrito : Identifiable {
    

}
