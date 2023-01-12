//
//  IntroTableView.swift
//  DigimonAPI
//
//  Created by user220831 on 1/5/23.
//
protocol SendCoordinatorIntroView: AnyObject {
    func chooseDigimon()
}
import Foundation
import UIKit

class IntroTableView: UITableView {
    
    weak var sendDelegate: SendCoordinatorIntroView?
    
    var viewModel = ViewModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
        viewModel.sendDigimonsDataDelegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        register(IntroViewCustomCell.self, forCellReuseIdentifier: IntroViewCustomCell.indentifierIntroCell)
        delegate = self
        dataSource = self
    }
}

extension IntroTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IntroViewCustomCell.indentifierIntroCell, for: indexPath) as? IntroViewCustomCell
            cell?.updateForm(data: ViewModel.digimons[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Digimons"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let observerIndexPath = ObserverIndexPath()
        observerIndexPath.observerIndexPath(indexPath.row)
        sendDelegate?.chooseDigimon()
    }
}
extension IntroTableView: SendDigimonsDataIntroViewModel {
    func reloadTableView(data: [DigimonModel]) {
        Task {
            self.reloadData()
        }
    }
    func updateForm(data: DigimonModel) {
    }
}
