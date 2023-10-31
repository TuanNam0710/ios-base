//
//  MainViewController.swift
//  iOSBase
//
//  Created by Pham Le Tuan Nam on 30/10/2023.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: SampleChildCoordinator?
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! Self
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
