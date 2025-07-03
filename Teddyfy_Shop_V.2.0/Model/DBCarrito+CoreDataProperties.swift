//
//  DBCarrito+CoreDataProperties.swift
//  Teddyfy_Shop_V.2.0
//
//  Created by Alonso on 3/07/25.
//
//

import Foundation
import CoreData


extension DBCarrito {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBCarrito> {
        return NSFetchRequest<DBCarrito>(entityName: "DBCarrito")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var precioTotal: Int32
    @NSManaged public var toItemCarrito: NSSet?
    @NSManaged public var toUsuario: DBUsuario?

    
    public var itemCarritoArray:[DBItemCarrito]{
        let itemcarritoSet = toItemCarrito as? Set<DBItemCarrito> ?? []
        return itemcarritoSet.sorted {
            guard let id1 = $0.id, let id2 = $1.id else { return false }
            return id1.uuidString < id2.uuidString
        }

    }
    
}

// MARK: Generated accessors for toItemCarrito
extension DBCarrito {

    @objc(addToItemCarritoObject:)
    @NSManaged public func addToToItemCarrito(_ value: DBItemCarrito)

    @objc(removeToItemCarritoObject:)
    @NSManaged public func removeFromToItemCarrito(_ value: DBItemCarrito)

    @objc(addToItemCarrito:)
    @NSManaged public func addToToItemCarrito(_ values: NSSet)

    @objc(removeToItemCarrito:)
    @NSManaged public func removeFromToItemCarrito(_ values: NSSet)

}

extension DBCarrito : Identifiable {

}
