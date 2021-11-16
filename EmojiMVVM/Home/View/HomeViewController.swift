//
//  HomeViewController.swift
//  DevpassViewModel
//
//  Created by Maria Eugênia P Teixeira on 08/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var label: UILabel = .init()
    var button: UIButton = .init()
    var nextButton: UIButton = .init()
    
    let vm: HomeViewModel = .init()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(nextButton)
        view.backgroundColor = .white
        title = "Home"
        setupLabel()
        setupButton()
        setupNextButton()
        
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
    
    func setupButton() {
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("TROCAR EMOJI", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = button.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 50)
        let width = button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        let height = button.heightAnchor.constraint(equalToConstant: 40.0)
        NSLayoutConstraint.activate([
            horizontalConstraint,
            topConstraint,
            width,
            height
        ])
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = .systemBlue
        nextButton.layer.cornerRadius = 8
        nextButton.setTitle("PRÓXIMA TELA", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        let width = nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        let height = nextButton.heightAnchor.constraint(equalToConstant: 40.0)
        NSLayoutConstraint.activate([
            horizontalConstraint,
            topConstraint,
            width,
            height
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        vm.didTapButton()
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        vm.didTapNextButton()
    }
    
}


extension HomeViewController: Presentable {
    
    func updateLabel(with text: String) {
        label.text = text
    }
    
    func presentNewScreen(with data: String) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, data: data)
        detailCoordinator.start()
    }
    
    
}

