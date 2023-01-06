//
//  ViewModel.swift
//  DigimonAPI
//
//  Created by user220831 on 1/4/23.
//

import Foundation
import UIKit

protocol SendDigimonsDataIntroViewModel: AnyObject {
    func reloadTableView(data: [DigimonModel])
    func updateForm(data: DigimonModel)
}
class ViewModel {
    weak var sendDigimonsDataDelegate: SendDigimonsDataIntroViewModel?
    static var digimons = Digimons()
    static var chooseDigimon = 0
    static var count: Int {
        return ViewModel.digimons.count
    }
    init() {
        get()
    }
    // MARK: - get
    private func get() {
        Task {
            guard let data = await Network.call(from:Network.EndPoints.digimonData) else {return}
            guard let decode = await Network.decode([DigimonModel].self, from: data) else {return}
            self.sendDigimonsDataDelegate?.reloadTableView(data: decode)
            ViewModel.digimons = decode
        }
    }
    lazy var getDigimonName = { (index: Int) -> String in
        return ViewModel.digimons[index].name ?? ""
    }
    func getDigimonImages(index: Int) async -> UIImage? {
        guard let img = ViewModel.digimons[index].img else {return nil}
        guard let data = await Network.call(from: URL(string: img)) else {return nil}
            return UIImage(data: data)
    }
    lazy var getDigimonLevel = { (index: Int) -> String in
        return ViewModel.digimons[index].level ?? ""
    }
}
