//
//  EmployeViewCooridnator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

final class EmployeViewCooridnator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    var refreshUI: () -> Void = {}
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let employeesList = EmployesListViewController()
        let viewModel = EmployesListViewModel(coordinator: self, dataManager: EmployeDataManager(dataRepository: EmployeDataRespositary()))
        employeesList.viewModel = viewModel
        employeesList.title = employeesList.viewModel.title
        employeesList.tabBarItem = UITabBarItem(title: employeesList.title, image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        self.navigationController.setViewControllers([employeesList], animated: true)
    }
    
    func loadAddEmployeeDetailsView() {
        let addEmployeeCoordinator = AddEmployeeDetailsCoordinator(navigationController: self.navigationController, parentCoordinator: self)
        childCoordinators.append(addEmployeeCoordinator)
        addEmployeeCoordinator.start()
    }
    
    func dismissViewController(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { (childCoordinator) -> Bool in
            return childCoordinator === coordinator
        }) else { return }
        childCoordinators.remove(at: index)
    }
    
    func saveAndDismissAddDetailsView(_ coordinator: Coordinator) {
        dismissViewController(coordinator)
        refreshUI()
    }
}

