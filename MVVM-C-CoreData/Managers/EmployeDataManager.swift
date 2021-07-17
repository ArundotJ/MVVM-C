//
//  EmployeDataManager.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation

final class EmployeDataManager {
    
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
