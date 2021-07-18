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
    var didUpdateChages: () -> Void { get set }
    func updateButtonTapped()
    func viewDidDisappear()
    func deleteButtonTapped()
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
    
    var didUpdateChages: () -> Void = {}
    
    var phoneNumber: String {
        return "Phone:    \(employe.phone)"
    }
    
    var employe: Employe
    
    private let dataManager: EmployeDataManagerType
    
    weak var coordinator: EmployeDetailsCoordinator? {
        didSet {
            updateLatestRecordChanges()
        }
    }
    
    init(employeID: UUID, employeDataManager: EmployeDataManagerType) {
        self.dataManager = employeDataManager
        self.employe = employeDataManager.getRecordFromID(id: employeID) ?? Employe.empty()
    }
    
    private func updateLatestRecordChanges() {
        self.coordinator?.refreshUI = { [weak self] in
            guard let self = self, let id = self.employe.id else {
                return
            }
            self.employe = self.dataManager.getRecordFromID(id: id) ?? Employe.empty()
            self.didUpdateChages()
        }
    }
    
    func updateButtonTapped() {
        coordinator?.loadUpdateEmployeDetails(record: employe)
    }
    
    func viewDidDisappear() {
        coordinator?.viewDidDisappear()
    }
    
    func deleteButtonTapped() {
        guard let employeUUID = employe.id else {
            return
        }
        self.dataManager.deleteEmployeRecord(id: employeUUID)
        coordinator?.popEmployeDetailsController()
    }
    
}
