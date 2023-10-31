//
//  SampleChildCoordinator.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 31/10/2023.
//

import UIKit

class SampleChildCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // do some logic to navigate to the 1st screen in this flow
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinish() {
        parentCoordinator?.didFinish()
    }
}
