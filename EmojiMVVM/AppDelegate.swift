//
//  AppDelegate.swift
//  EmojiMVVM
//
//  Created by Maria Eugênia P Teixeira on 08/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: HomeCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = HomeCoordinator(window: window)
        
        self.window = window
        
        coordinator?.start()
        
        return true
    }

}

