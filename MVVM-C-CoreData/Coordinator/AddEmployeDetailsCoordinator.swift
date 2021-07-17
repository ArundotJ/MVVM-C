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
    
    let addEmployeNavigationController = UINavigationController()
    
    var didReceiveImage: (UIImage?) -> Void = { _ in }
    
    private var addEmployeDetailsViewModel: AddEmployeeDetailsViewModel?
    
    weak var parentCoordinator: EmployeViewCooridnator?
    
    init(navigationController: UINavigationController, parentCoordinator: EmployeViewCooridnator) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let addEmployeeDetailsController =  AddEmployeeDetailsViewController(nibName: "AddEmployeeDetailsViewController", bundle: Bundle.main)
        addEmployeDetailsViewModel = AddEmployeeDetailsViewModel(coordinator: self,
                                                    dataManager: EmployeDataManager(dataRepository: EmployeDataRespositary()))
        addEmployeeDetailsController.viewModel = addEmployeDetailsViewModel
        addEmployeNavigationController.setViewControllers([addEmployeeDetailsController], animated: false)
        self.navigationController.present(addEmployeNavigationController, animated: true, completion: nil)
    }
    
    func dismissAddDetailsView() {
        self.parentCoordinator?.dismissViewController(self)
    }
    
    func saveAndDismissView() {
        self.addEmployeNavigationController.dismiss(animated: true, completion: nil)
        self.parentCoordinator?.saveAndDismissAddDetailsView(self)
    }
    
    func showImagePickerController(imageCompletion: @escaping (UIImage?) -> Void) {
        self.didReceiveImage = imageCompletion
        let imagePickerCoordinator = ImagePickerCoordinator(navigation: addEmployeNavigationController, parentCoordinator: self)
        self.childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    func didFinishImagePicking(from coordinator: Coordinator, image: UIImage?) {
        self.didReceiveImage(image)
        guard let index = childCoordinators.firstIndex(where: { (childCoordinator) -> Bool in
            return childCoordinator === coordinator
        }) else { return }
        childCoordinators.remove(at: index)
    }
    
}

