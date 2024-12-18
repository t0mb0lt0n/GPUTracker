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
        mainView.infoTableView.delegate = self
    }
    
    private func setupViewModel() {
        
    }
}

//MARK: - UITableViewDataSource
extension InfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    internal func tableView(
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
            return 3
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InfoTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? InfoTableViewCell else {
            fatalError(.cellError)
        }
        cell.selectionStyle = .default
        cell.accessoryType = .checkmark
        switch indexPath.row {
        case 0:
            cell.configurateCell(
                descriptionValue: LegendDescription.onlineDescription.rawValue,
                onlineStatus: .online
            )
        case 1:
            cell.configurateCell(
                descriptionValue: LegendDescription.partiallyDescription.rawValue,
                onlineStatus: .partially
            )
        case 2:
            cell.configurateCell(
                descriptionValue: LegendDescription.offlineDescription.rawValue,
                onlineStatus: .offline
            )
        default:
            cell.textLabel?.text = .failure
        }
        return cell
    }
    
    //setup height for header in section
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        Constants.heightForHeaderInSection
    }
    //setup height for footer in section
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        Constants.heightForFooterInSection
    }
    //custom headerView
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let customHeaderView = UIView()
        let sectionNameLabel = UILabel(
            frame: CGRect(
                x: Constants.developerNameXAxis,
                y: Constants.developerNameYAxis,
                width: Constants.developerNameWidth,
                height: Constants.developerNameHeight
            )
        )
        sectionNameLabel.textColor = .systemGray
        customHeaderView.addSubview(sectionNameLabel)
        
        switch section {
        case 0:
            sectionNameLabel.text = LegendDescription.legendName.rawValue
        default:
            return nil
        }
        return customHeaderView
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
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

