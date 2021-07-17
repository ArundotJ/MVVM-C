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
        newRecored.id = UUID()
        newRecored.employeId = Int16(record.employeID ?? 0)
        newRecored.profileImageData = record.profileImage
        newRecored.name = record.name
        newRecored.phoneNumber = Int64(record.phone)
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
