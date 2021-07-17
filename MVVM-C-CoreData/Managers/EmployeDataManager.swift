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
}
