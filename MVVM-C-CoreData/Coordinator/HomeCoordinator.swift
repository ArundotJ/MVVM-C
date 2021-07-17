//
//  HomeCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeController = HomeViewController()
        homeController.viewModel = HomeViewModel()
        homeController.tabBarItem = UITabBarItem(title: homeController.title, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        self.navigationController.setViewControllers([homeController], animated: true)
    }
}
