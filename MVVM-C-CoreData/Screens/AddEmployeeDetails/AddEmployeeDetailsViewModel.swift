//
//  AddEmployeeDetailsViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit
import Combine

protocol AddEmployeeDetailsViewModelType {
    var profileImage: UIImage? { get set }
    var title: String { get set }
    func saveEmployeData(employe: Employe)
    func addProfileImageButtonTapped(receivedImage: @escaping (UIImage?) -> Void)
    func viewDidDisapper()
}

final class AddEmployeeDetailsViewModel: AddEmployeeDetailsViewModelType {
    
    var profileImage: UIImage?
    
    var title: String = "Add"
    
    var employeRecord: Employe?
        
    weak var coordinator: AddEmployeeDetailsCoordinator?
    
    var dataManager: EmployeDataManagerType
        
    init(coordinator: AddEmployeeDetailsCoordinator, dataManager: EmployeDataManagerType) {
        self.coordinator = coordinator
        self.dataManager = dataManager
    }
    
    func viewDidDisapper() {
        self.coordinator?.dismissAddDetailsView()
    }
    
    func saveEmployeData(employe: Employe) {
        self.dataManager.addEmployeRecord(record: employe)
        self.coordinator?.saveAndDismissView()
    }
    
    func addProfileImageButtonTapped(receivedImage: @escaping (UIImage?) -> Void) {
        self.coordinator?.showImagePickerController(imageCompletion: receivedImage)
    }
}
