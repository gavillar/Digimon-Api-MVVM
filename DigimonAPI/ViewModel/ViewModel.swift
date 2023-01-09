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
    weak var indexObserver: DigimonIndexObserver?
    
    static var digimons = Digimons()
    
    static var selectedIndex: Int = 0
    
    lazy var observerIndexPath = {(index: Int) -> () in
        return ViewModel.selectedIndex = index
    }
    static var count: Int {
        return ViewModel.digimons.count
    }
    
    init() {
        get()
    }
    // MARK: - get
    private func get() {
        Task { [weak self] in
            guard let data = await Network.call(from:Network.EndPoints.digimonData) else {return}
            guard let decode = await Network.decode([DigimonModel].self, from: data) else {return}
            self?.sendDigimonsDataDelegate?.reloadTableView(data: decode)
            ViewModel.digimons = decode
        }
    }
    lazy var getDigimonName = { [weak self] (index: Int) -> String in
        return ViewModel.digimons[index].name ?? ""
    }
    lazy var getDigimonImages = { [weak self] (index: Int) -> UIImage? in
        guard let img = ViewModel.digimons[index].img else {return nil}
        guard let data = await Network.call(from: URL(string: img)) else {return nil}
            return UIImage(data: data)
    }
    lazy var getDigimonLevel = { [weak self] (index: Int) -> String in
        return ViewModel.digimons[index].level ?? ""
    }
}
