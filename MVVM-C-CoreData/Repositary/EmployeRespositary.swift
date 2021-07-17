//
//  EmployeRespositary.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation


final class EmployeRespositary: RepositaryHandler {
    
    func createRecord(record: Employe) {
        let newRecored = CDEmploye(context: PersistanceManager.shared.managerObjectContext)
        newRecored.id = record.employeID
        newRecored.profileImageData = record.profileImage
        newRecored.name = record.name
        newRecored.phoneNumber = record.phone
        PersistanceManager.shared.saveChanges()
    }
    
    func getAllRecord() -> [Employe] {
        return []
    }
    
    func updateRecord(id: Int) {
        
    }
    
    func deleteRecord(record: Employe) {
        
    }
}
