//
//  EmployeDetailsViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

protocol EmployeDetailsViewModelType {
    var name: String { get }
    var profileImage: UIImage? { get }
    var phoneNumber: String { get }
    var employeID: String { get }
}

final class EmployeDetailsViewModel: EmployeDetailsViewModelType {

    var name: String {
        return "Name:    \(String(describing: employe.name ?? ""))"
    }
    
    var employeID: String {
        return  "Employe ID:    \(String(describing: employe.employeID ?? 0))"
    }
    
    var profileImage: UIImage? {
        UIImage(data: employe.profileImage ?? Data())
    }
    
    var phoneNumber: String {
        return "Phone:    \(employe.phone)"
    }
    
    let employe: Employe
    
    init(employe: Employe) {
        self.employe = employe
    }
    
}
