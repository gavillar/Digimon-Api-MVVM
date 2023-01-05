//
//  IntroViewModel.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//

import Foundation

protocol SendDigimonsDataIntroViewModel: AnyObject {
    func reloadTableView(data: [DigimonModel])
    func updateForm(data: DigimonModel)
}
class IntroViewModel {
    weak var sendDigimonsDataDelegate: SendDigimonsDataIntroViewModel?
    lazy var digimon = [DigimonModel]()
    var count: Int {
        return digimon.count
    }
// MARK: - getDigimons
     private func getData() {
        Task {
            guard let data = await Network.call(from:Network.EndPoints.digimonData) else {return}
            guard let decode = await Network.decode([DigimonModel].self, from: data) else {return}
            self.sendDigimonsDataDelegate?.reloadTableView(data: decode)
            digimon = decode
        }
    }
    init() {
        getData()
    }
}
