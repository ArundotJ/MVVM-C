//
//  EmployeItemCellViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

protocol EmployeItemCellViewModelType {
    var name: String? { get }
    var profileImageData: Data? { get }
    var employeID: Int? { get }
    var phoneNumber: Int? { get }
}

final class EmployeItemCellViewModel: EmployeItemCellViewModelType {
    
    var name: String? {
        employe.name
    }
    
    var profileImageData: Data? {
        employe.profileImage
    }
    
    var employeID: Int? {
        employe.employeID
    }
    
    var phoneNumber: Int? {
        employe.phone
    }
    
    private let employe: Employe
    
    init(employe: Employe) {
        self.employe = employe
    }
}
