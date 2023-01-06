//
//  Create+NavigationController.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//

import Foundation
import UIKit

extension Create {
    static func navigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear
        navigationController.navigationBar.standardAppearance = standardAppearance
        navigationController.navigationBar.scrollEdgeAppearance = standardAppearance
        return navigationController
    }
}
