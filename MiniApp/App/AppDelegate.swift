//
//  AppDelegate.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mainNavigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupView()
        
        return true
    }
    
    private func setupView() {
        let homeVC = LoginViewController()
        
        mainNavigationController = UINavigationController(rootViewController: homeVC)
        mainNavigationController?.isNavigationBarHidden = false
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = mainNavigationController
    }

}

