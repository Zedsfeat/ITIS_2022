//
//  PhotoNote+CoreDataProperties.swift
//  112
//
//  Created by zedsbook on 10.12.2022.
//
//

import Foundation
import CoreData


extension PhotoNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoNote> {
        return NSFetchRequest<PhotoNote>(entityName: "PhotoNote")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var image: Data?

}

extension PhotoNote : Identifiable {

}
