//
//  MainTabBarController.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let employeCoordinator = EmployeViewCooridnator(navigation: UINavigationController())
    let passportsListCoordinator = PassportListCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        homeCoordinator.start()
        employeCoordinator.start()
        passportsListCoordinator.start()
        UINavigationBar.appearance().prefersLargeTitles = true
        viewControllers = [homeCoordinator.navigationController, employeCoordinator.navigationController, passportsListCoordinator.navigationController]
    }
}

