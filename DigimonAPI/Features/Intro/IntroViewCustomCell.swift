//
//  IntroViewCustomCell.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//

import Foundation
import UIKit

class IntroViewCustomCell: UITableViewCell {
    var introviewmodel = IntroViewModel()
    static let indentifierIntroCell = "indentifierIntroCell"

    let characterView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Digimon"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
            
            characterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            characterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            characterView.widthAnchor.constraint(equalTo: characterView.heightAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterView.trailingAnchor, constant: 50),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(characterView)
        contentView.addSubview(nameLabel)
        setupConstrains()
        introviewmodel.sendDigimonsDataDelegate = self
}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension IntroViewCustomCell: SendDigimonsDataIntroViewModel {
    func reloadTableView(data: [DigimonModel]) {
    }
    func updateForm(data: DigimonModel) {
        Task {
            nameLabel.text = data.name
            guard let data = await Network.call(from: URL(string: data.img)) else {return}
            characterView.image = UIImage(data: data)
        }
    }
}
