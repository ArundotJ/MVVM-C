//
//  EmployesListViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import Foundation

protocol EmployesListViewModelType {
    var title: String {get set}
    var employeList: [Employe] { get }
    var refreshUI: () -> Void { get set }
    func fetchEmployeDetails()
    func addButtonTapped()
    func didSelectEmployeItem(indexPath: IndexPath)
}

final class EmployesListViewModel: EmployesListViewModelType {
    
    var title: String = "Employees"
    
    var employeList: [Employe] = []
    
    var refreshUI: () -> Void = {}
    
    var employeDataManager: EmployeDataManagerType
    
    weak var coordinator: EmployeViewCooridnator?
    
    init(coordinator: EmployeViewCooridnator,dataManager: EmployeDataManagerType) {
        self.coordinator = coordinator
        self.employeDataManager = dataManager
        self.coordinator?.refreshUI = { [weak self] in
            self?.fetchEmployeDetails()
            self?.refreshUI()
        }
    }
    
    func fetchEmployeDetails() {
        self.employeList = self.employeDataManager.getAllRecords()
        self.refreshUI()
    }
        
    func addButtonTapped() {
        coordinator?.loadAddEmployeeDetailsView()
    }
    
    func didSelectEmployeItem(indexPath: IndexPath) {
        guard let employeID = employeList[indexPath.row].id else {
            return
        }
        self.coordinator?.loadEmployeDetailsView(employeID: employeID)
    }
}
