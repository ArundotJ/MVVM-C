//
//  CDEmploye+CoreDataProperties.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//
//

import Foundation
import CoreData


extension CDEmploye {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmploye> {
        return NSFetchRequest<CDEmploye>(entityName: "CDEmploye")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var profileImageData: Data?
    @NSManaged public var phoneNumber: Int32

}

extension CDEmploye : Identifiable {

}