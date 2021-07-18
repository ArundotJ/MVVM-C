//
//  EmployeRespositary.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation
import CoreData


final class EmployeDataRespositary: RepositaryHandler {
    
    func createRecord(record: Employe) {
        let newRecored = CDEmploye(context: PersistanceManager.shared.managerObjectContext)
        newRecored.id = record.id
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
    
    func getRecord(id: UUID) -> Employe? {
        return getCDEmployeRecord(id: id)?.convertToEmploye()
    }
    
    private func getCDEmployeRecord(id: UUID) -> CDEmploye? {
        let predicate = NSPredicate(format: "id == %@", id as CVarArg)
        if let employeRecord = PersistanceManager.shared.fetchRecords(objectType: CDEmploye.self, predicate: predicate)?.first {
            return employeRecord
        }
        return nil
    }
    
    func updateRecord(employeData: Employe) {
        
        guard let idValue = employeData.id, let record = getCDEmployeRecord(id: idValue) else {
            return
        }
        record.name = employeData.name
        record.employeId = Int16(employeData.employeID ?? 0)
        record.profileImageData = employeData.profileImage
        record.phoneNumber = Int64(employeData.phone)
        PersistanceManager.shared.saveChanges()
    }
    
    func deleteRecord(id: UUID) {
        guard let record = getCDEmployeRecord(id: id) else {
            return
        }
        PersistanceManager.shared.managerObjectContext.delete(record)
    }
}
