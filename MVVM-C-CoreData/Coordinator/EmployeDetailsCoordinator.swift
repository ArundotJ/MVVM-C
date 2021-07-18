//
//  EmployeDetailsCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 17/07/21.
//

import UIKit

final class EmployeDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var employeID: UUID
    
    var refreshUI: () -> Void = {}
    
    weak var parentCoordinator: EmployeViewCooridnator?
    
    let navigationController: UINavigationController
    
    init(navigation: UINavigationController, employeID: UUID, parentCoordinator: EmployeViewCooridnator) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigation
        self.employeID = employeID
    }
    
    func start() {
        let detailsController = EmployeDetailsViewController(nibName: "EmployeDetailsViewController", bundle: Bundle.main)
        let viewModel = EmployeDetailsViewModel(employeID: employeID,
                                                employeDataManager: EmployeDataManager(dataRepository: EmployeDataRespositary()))
        viewModel.coordinator = self
        detailsController.viewModel = viewModel
        self.navigationController.pushViewController(detailsController, animated: true)
    }
    
    func loadUpdateEmployeDetails(record: Employe) {
        let addEmployeeCoordinator = AddEmployeeDetailsCoordinator(navigationController: self.navigationController)
        addEmployeeCoordinator.delegate = self
        addEmployeeCoordinator.employeRecord = record
        childCoordinators.append(addEmployeeCoordinator)
        addEmployeeCoordinator.start()
    }
    
    func dismissViewController(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { (childCoordinator) -> Bool in
            return childCoordinator === coordinator
        }) else { return }
        childCoordinators.remove(at: index)
    }
    
    func viewDidDisappear() {
        self.parentCoordinator?.refreshUI()
        self.parentCoordinator?.dismissViewController(self)
    }
    
    func popEmployeDetailsController() {
        self.parentCoordinator?.refreshUI()
        self.navigationController.popViewController(animated: true)
    }
    
    deinit {
        debugPrint("Deinitialized EmployeDetailsCoordinator")
    }
}

extension EmployeDetailsCoordinator: AddEmployeeDetailsCoordinatorDelegate {
    func dismissAddEmployeDetailsView(_ coordinator: Coordinator) {
        self.refreshUI()
        dismissViewController(coordinator)
    }
}
