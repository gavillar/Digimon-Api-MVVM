//
//  AppCoordinator.swift
//  DigimonAPI
//
//  Created by user220831 on 1/6/23.
//
import Foundation
import UIKit

protocol CoordinatorDelegate: AnyObject {
    func start()
}
class Coordinator: CoordinatorDelegate {
    let window: UIWindow?
    let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    func start() {
        let introviewcontroller = IntroViewController()
        introviewcontroller.coordinator = self
        navigationController.pushViewController(introviewcontroller, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    func showLevelViewController() {
        let levelviewcontroller = LevelViewController()
        levelviewcontroller.coordinator = self
        navigationController.pushViewController(levelviewcontroller, animated: true)
      
    }
}
