//
//  DetailCoordinator.swift
//  EmojiMVVM
//
//  Created by Maria Eugênia P Teixeira on 09/11/21.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    let navigationController: UINavigationController?
    let data: String

    init(navigationController: UINavigationController?, data: String) {
        self.navigationController = navigationController
        self.data = data
    }
    
    func start() {
        let vm = DetailViewModel(data: data)
        let vc = DetailViewController(with: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
}
