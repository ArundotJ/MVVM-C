//
//  AddEmployeDetailsCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

final class AddEmployeeDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    weak var parentCoordinator: EmployeViewCooridnator?
    
    init(navigationController: UINavigationController, parentCoordinator: EmployeViewCooridnator) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let addEmployeNavigationController = UINavigationController()
        let addEmployeeDetailsController =  AddEmployeeDetailsViewController(nibName: "AddEmployeeDetailsViewController", bundle: Bundle.main)
        addEmployeeDetailsController.viewModel = AddEmployeeDetailsViewModel(coordinator: self)
        addEmployeNavigationController.setViewControllers([addEmployeeDetailsController], animated: false)
        self.navigationController.present(addEmployeNavigationController, animated: true, completion: nil)
    }
    
    func dismissAddDetailsView() {
        self.parentCoordinator?.dismissViewController(self)
    }
    
}

