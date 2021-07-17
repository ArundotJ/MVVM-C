//
//  EmployesListViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation

protocol EmployesListViewModelType {
    var title: String {get set}
    func addButtonTapped()
}

final class EmployesListViewModel: EmployesListViewModelType {
    
    var title: String = "Employees"
    
    weak var coordinator: EmployeViewCooridnator?
    
    func addButtonTapped() {
        coordinator?.loadAddEmployeeDetailsView()
    }
}
