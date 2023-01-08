//
//  NivelViewController.swift
//  DigimonAPI
//
//  Created by user220831 on 1/6/23.
//

import Foundation
import UIKit


class LevelViewController: UIViewController {
    var coordinator: Coordinator?
    let viewModel = ViewModel()
    
    lazy var digimonImage: UIImageView = {
        let view = UIImageView()
        Task{
            view.image = await viewModel.getDigimonImages(index: ViewModel.selectedIndex)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var digimonLevel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Level\n" + viewModel.getDigimonLevel(ViewModel.selectedIndex)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        title = viewModel.getDigimonName(ViewModel.selectedIndex)
        setupView()
        setupConstrains()
        
    }
    
    func setupView() {
        view.addSubview(digimonImage)
        view.addSubview(digimonLevel)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
        
            digimonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            digimonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            digimonImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            digimonImage.widthAnchor.constraint(equalTo: digimonImage.heightAnchor),
            
            digimonLevel.topAnchor.constraint(equalTo: digimonImage.bottomAnchor),
            digimonLevel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       
        
        ])
    }
}
