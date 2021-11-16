//
//  DetailViewController.swift
//  EmojiMVVM
//
//  Created by Maria Eugênia P Teixeira on 09/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var label: UILabel = .init()
    
    let vm: DetailViewModel
    
    
    init(with vm: DetailViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        vm = .init(data: "")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        view.addSubview(label)
        view.backgroundColor = .white
        title = "Detail"
        setupLabel()
        
        vm.presenter = self
    }
    
    func setupLabel() {
        label.text = "🤘"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let width = label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        let height = label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        NSLayoutConstraint.activate([
            horizontalConstraint,
            verticalConstraint,
            width,
            height
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.loadData()
    }
}

extension DetailViewController: DetailPresentable {
    func showData(_ data: String) {
        label.text = data
    }
    
    func isLoading(_ isLoading: Bool) {
        if isLoading {
            //loading
        } else {
            //encerra o loading
        }
    }
    
    
}
