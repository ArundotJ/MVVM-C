//
//  AppCoordinator.swift
//  MVVM-C-CoreData
//
//  Created by Arun Jayasree Kumar on 16/07/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private var window: UIWindow?
    
    init(_window: UIWindow?) {
        self.window = _window
    }
    
    func start() {
        self.window?.rootViewController = MainTabBarController()
        self.window?.makeKeyAndVisible()
    }
}
