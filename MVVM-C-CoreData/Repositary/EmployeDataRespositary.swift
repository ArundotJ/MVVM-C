//
//  EmployeRespositary.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation


final class EmployeDataRespositary: RepositaryHandler {
    
    func createRecord(record: Employe) {
        let newRecored = CDEmploye(context: PersistanceManager.shared.managerObjectContext)
        newRecored.id = record.employeID
        newRecored.profileImageData = record.profileImage
        newRecored.name = record.name
        newRecored.phoneNumber = record.phone
        PersistanceManager.shared.saveChanges()
    }
    
    func getAllRecords() -> [Employe] {
        if let records = PersistanceManager.shared.fetchRecords(objectType: CDEmploye.self) {
            return records.map({ $0.convertToEmploye()})
        }
        return []
    }
    
    func updateRecord(id: Int) {
        
    }
    
    func deleteRecord(record: Employe) {
        
    }
}
