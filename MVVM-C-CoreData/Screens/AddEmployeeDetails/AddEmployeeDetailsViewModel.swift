//
//  AddEmployeeDetailsViewModel.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit
import Combine

protocol AddEmployeeDetailsViewModelType {
    var title: String { get set }
    func saveEmployeData(employe: Employe)
    func viewDidDisapper()
}

final class AddEmployeeDetailsViewModel: AddEmployeeDetailsViewModelType {
    
    var title: String = "Add"
    
    weak var coordinator: AddEmployeeDetailsCoordinator?
    
    init(coordinator: AddEmployeeDetailsCoordinator) {
        self.coordinator = coordinator
    }
    
    func viewDidDisapper() {
        self.coordinator?.dismissAddDetailsView()
    }
    
    func saveEmployeData(employe: Employe) {
        
    }

}
