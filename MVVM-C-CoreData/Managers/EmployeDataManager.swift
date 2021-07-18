//
//  EmployeDataManager.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation

protocol EmployeDataManagerType {
    func addEmployeRecord(record: Employe)
    func getAllRecords() -> [Employe]
    func getRecordFromID(id: UUID) -> Employe?
    func updateRecord(employeData: Employe)
    func deleteEmployeRecord(id: UUID)
}

final class EmployeDataManager: EmployeDataManagerType {
    
    let dataRepository: RepositaryHandler
    
    init(dataRepository: RepositaryHandler) {
        self.dataRepository = dataRepository
    }
    
    func addEmployeRecord(record: Employe) {
        self.dataRepository.createRecord(record: record)
    }
    
    func getAllRecords() -> [Employe] {
        self.dataRepository.getAllRecords()
    }
    
    func getRecordFromID(id: UUID) -> Employe? {
        self.dataRepository.getRecord(id: id)
    }
    
    func updateRecord(employeData: Employe) {
        self.dataRepository.updateRecord(employeData: employeData)
    }
    
    func deleteEmployeRecord(id: UUID) {
        self.dataRepository.deleteRecord(id: id)
    }
}
