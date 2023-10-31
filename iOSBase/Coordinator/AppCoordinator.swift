//
//  AppCoordinator.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 30/10/2023.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func didFinish()
}
  
class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
  
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
  
    func start() {
        let childCoordinator = SampleChildCoordinator(navigationController: navigationController)
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func didFinish() {
        childCoordinators.removeAll { $0 is SampleChildCoordinator }
    }
}
