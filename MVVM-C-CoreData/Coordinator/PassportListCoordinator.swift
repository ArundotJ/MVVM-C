//
//  PassportListCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

final class PassportListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let passportsListController = PassportsListViewController()
        passportsListController.viewModel = PassportsListViewModel()
        passportsListController.title = passportsListController.viewModel.title
        passportsListController.tabBarItem = UITabBarItem(title: passportsListController.title, image: UIImage(systemName: "wallet.pass"), selectedImage: UIImage(systemName: "wallet.pass.fill"))
        self.navigationController.setViewControllers([passportsListController], animated: false)
    }
    
    
}
