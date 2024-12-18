//
//  InfoViewController.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var mainView = view as! InfoView
    private var viewModel: InfoViewModel
    
    init() {
        viewModel = InfoViewModel()
        super.init(nibName: nil, bundle: nil)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = InfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupViewModel()
    }
    
    private func setupMainView() {
        mainView.infoTableView.dataSource = self
    }
    
    private func setupViewModel() {
        
    }

    

}

//MARK: - UITableViewDataSource
extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    private func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        let footerPadding = UIView()
        footerPadding.backgroundColor = .systemGreen
        return footerPadding
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 0:
            return viewModel.numberOfSections
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainCell.defaultIdentifier,
            for: indexPath
        ) as? MainCell else {
            fatalError(.cellError)
        }
        cell.selectionStyle = .default
        cell.accessoryType = .disclosureIndicator
        switch indexPath.section {
        case 0:
            cell.configurateCell(
                descriptionName: viewModel.,
                descriptionValue: viewModel.microsoftSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.microsoftSectionDataSource[indexPath.row].onlineStatus
            )
        case 1:
            cell.configurateCell(
                descriptionName: viewModel.sonySectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.sonySectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.sonySectionDataSource[indexPath.row].onlineStatus
            )
        case 2:
            cell.configurateCell(
                descriptionName: viewModel.segaSectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.segaSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.segaSectionDataSource[indexPath.row].onlineStatus
            )
        default:
            cell.textLabel?.text = .failure
        }
        return cell
    }
    
    //setup height for header in section
    private func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        Constants.heightForHeaderInSection
    }
    //setup height for footer in section
    private func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        Constants.heightForFooterInSection
    }
    //custom headerView
    private func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let customHeaderView = UIView()
        let developerNameLabel = UILabel(
            frame: CGRect(
                x: Constants.developerNameXAxis,
                y: Constants.developerNameYAxis,
                width: Constants.developerNameWidth,
                height: Constants.developerNameHeight
            )
        )
        developerNameLabel.textColor = .systemGray
        customHeaderView.addSubview(developerNameLabel)
        
        switch section {
        case let sectionNumber:
            developerNameLabel.text = viewModel.developerListDataSource[sectionNumber].developerName
        }
        return customHeaderView
    }
}

extension InfoViewController {
    private enum Constants {
        static let developerNameXAxis: Int = 20
        static let developerNameYAxis: Int = 20
        static let developerNameBaseLeadingOffset: Int = 20
        static let developerNameWidth: Int = Int(UIScreen.main.bounds.width) - 2 * (developerNameXAxis + developerNameBaseLeadingOffset)
        static let developerNameHeight: Int = 23
        static let heightForFooterInSection: CGFloat = 0.0
        static let heightForHeaderInSection: CGFloat = 50.0
    }
}

