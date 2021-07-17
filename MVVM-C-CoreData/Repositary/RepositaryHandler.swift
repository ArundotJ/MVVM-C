//
//  RepositaryHandler.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import Foundation

protocol RepositaryHandler {
    func createRecord(record: Employe)
    func getAllRecord() -> [Employe]
    func updateRecord(id: Int)
    func deleteRecord(record: Employe)
}
