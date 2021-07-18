//
//  Employe.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation


struct Employe {
    let id: UUID?
    let name: String?
    let employeID: Int?
    let phone: Int
    let profileImage: Data?
}

extension Employe {
    static func empty() -> Employe {
        return Employe(id: nil, name: nil, employeID: nil, phone: 0, profileImage: nil)
    }
}
