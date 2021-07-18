//
//  RepositaryHandler.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation

protocol RepositaryHandler {
    func createRecord(record: Employe)
    func getAllRecords() -> [Employe]
    func updateRecord(employeData: Employe)
    func deleteRecord(id: UUID)
    func getRecord(id: UUID) -> Employe?
}
