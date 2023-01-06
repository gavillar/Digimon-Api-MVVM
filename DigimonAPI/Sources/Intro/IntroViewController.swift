//
//  IntroView.swift
//  DigimonAPI  
//
//  Created by user220831 on 1/4/23.
//

import Foundation
import UIKit

class IntroViewController: UIViewController{
    var coordinator: Coordinator?
    let tableview = IntroTableView()
    var introviewmodel = ViewModel()
    
    override func loadView() {
        super.loadView()
        view = tableview
        view.backgroundColor = .white
        setupConstrains()
        tableview.sendDelegate = self
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension IntroViewController: sendCoordinatorIntroView {
    func chooseDigimon() {
        coordinator?.showLevelViewController()
    }
}




            
     





