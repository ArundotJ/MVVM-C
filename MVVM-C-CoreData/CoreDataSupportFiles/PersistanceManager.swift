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
        let container = NSPersistentContainer(name: "OrganizationRecord")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load DataModel \(error.localizedDescription)")
            }
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

extension PersistanceManager {
    func fetchRecords<T: NSManagedObject> (objectType: T.Type, predicate: NSPredicate? = nil) -> [T]? {
        do {
            let managedObject = managerObjectContext
            let fetchRequest = objectType.fetchRequest()
            if let havePredicate = predicate {
                fetchRequest.predicate = havePredicate
            }
            guard let result = try managedObject.fetch(fetchRequest) as? [T] else {
                return []
            }
            return result
        } catch {
            debugPrint("Error while loading data \(error.localizedDescription)")
            return nil
        }
    }
}
