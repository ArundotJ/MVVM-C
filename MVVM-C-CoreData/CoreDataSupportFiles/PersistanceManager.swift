//
//  PersistanceManager.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation
import CoreData

final class PersistanceManager {
    
    static let shared = PersistanceManager()
    
    private init() {}
    
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (_, error) in
            fatalError("Failed to load DataModel")
        }
        return container
    }()
    
    lazy var managerObjectContext: NSManagedObjectContext = {
        persistanceContainer.viewContext
    }()
    
    func saveChanges() {
        if managerObjectContext.hasChanges {
            do {
                try managerObjectContext.save()
            } catch {
                debugPrint("Failed to save changes in ManageObjectContext \(error)")
            }
        }
    }
}
