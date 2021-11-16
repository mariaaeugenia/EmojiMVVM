//
//  HomeCoordinator.swift
//  EmojiMVVM
//
//  Created by Maria Eugênia P Teixeira on 08/11/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        navigationController = .init()
        navigationController.navigationBar.backgroundColor = .systemBlue
        navigationController.navigationBar.tintColor = .white
    }
    
    func start() {
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
