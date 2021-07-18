//
//  EmployeDetailsCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

final class EmployeDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var employeData: Employe
    
    let navigationController: UINavigationController?
    
    init(navigation: UINavigationController?, employeData: Employe) {
        self.navigationController = navigation
        self.employeData = employeData
    }
    
    func start() {
        let detailsController = EmployeDetailsViewController(nibName: "EmployeDetailsViewController", bundle: Bundle.main)
        detailsController.viewModel = EmployeDetailsViewModel(employe: self.employeData)
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
}
