//
//  AddEmployeeDetailsViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit
import Combine

typealias EmployeRecordDetails = (name: String, phone: String, profileImage: UIImage, employeID: String)

protocol AddEmployeeDetailsViewModelType {
    var profileImage: UIImage? { get set }
    var employeDetails: EmployeRecordDetails? { get }
    var showUpdateButton: Bool { get }
    var title: String { get set }
    func saveEmployeData(name: String, phone: String, employeID: String, profileImage: Data)
    func updateEmployeData(name: String, phone: String, employeID: String, profileImage: Data)
    func addProfileImageButtonTapped(receivedImage: @escaping (UIImage?) -> Void)
    func viewDidDisapper()
}

final class AddEmployeeDetailsViewModel: AddEmployeeDetailsViewModelType {
    
    var profileImage: UIImage?
    
    var title: String = "Add"
    
    var employeRecord: Employe?
    
    var showUpdateButton: Bool {
        return employeDetails != nil
    }
    
    var employeDetails: EmployeRecordDetails? {
        guard let employe = employeRecord,
              let name = employe.name,
              let image = UIImage(data: employe.profileImage ?? Data()),
              let employeID = employe.employeID else {
            return nil
        }
        return (name, "\(employe.phone)", image, "\(employeID)")
    }
        
    weak var coordinator: AddEmployeeDetailsCoordinator?
    
    var dataManager: EmployeDataManagerType
        
    init(coordinator: AddEmployeeDetailsCoordinator, dataManager: EmployeDataManagerType) {
        self.coordinator = coordinator
        self.dataManager = dataManager
    }
    
    func viewDidDisapper() {
        self.coordinator?.dismissAddDetailsView()
    }
    
    func saveEmployeData(name: String, phone: String, employeID: String, profileImage: Data) {
        let employe = Employe(id: UUID(),
                              name: name,
                              employeID: Int(employeID),
                              phone: Int(phone) ?? 0,
                              profileImage: profileImage)
        self.dataManager.addEmployeRecord(record: employe)
        DispatchQueue.main.async {
            self.coordinator?.saveAndDismissView()
        }
    }
    
    func updateEmployeData(name: String, phone: String, employeID: String, profileImage: Data) {
        let employe = Employe(id: employeRecord?.id,
                              name: name,
                              employeID: Int(employeID),
                              phone: Int(phone) ?? 0,
                              profileImage: profileImage)
        self.dataManager.updateRecord(employeData: employe)
        DispatchQueue.main.async {
            self.coordinator?.saveAndDismissView()
        }
    }
    
    func addProfileImageButtonTapped(receivedImage: @escaping (UIImage?) -> Void) {
        self.coordinator?.showImagePickerController(imageCompletion: receivedImage)
    }
}
