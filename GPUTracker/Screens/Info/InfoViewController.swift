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
    
    @objc private func closeButtonTapped() {
        
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
            return viewModel.numbersOfRowsInStatusSection
        case 1:
            return viewModel.numbersOfRowsInSectionDescription
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let statusDescriptionCell = tableView.dequeueReusableCell(
            withIdentifier: OnlineStatusTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? OnlineStatusTableViewCell else {
            fatalError(.cellError)
        }
        statusDescriptionCell.setupCellSeparator(withSeparatorLeftInset: 30, andSeparatorRightInset: 0)
    
        guard let sectionDescriptionCell = tableView.dequeueReusableCell(
            withIdentifier: SectionDescriptionTableViewCell.defaultIdentifier,
            for: indexPath
        ) as? SectionDescriptionTableViewCell else {
            fatalError(.cellError)
        }
        sectionDescriptionCell.setupCellSeparator(withSeparatorLeftInset: 50, andSeparatorRightInset: 0)

        switch indexPath.section {
        case 0:
            statusDescriptionCell.setupCellSubviews(
                descriptionValue: Legend.StatusDescription.allCases[indexPath.row].rawValue,
                statusImage: Legend.statusImage[indexPath.row]
            )
            return statusDescriptionCell
        case 1:
            sectionDescriptionCell.setupCellSubviews(
                descriptionValue: Legend.SectionDesccription.allCases[indexPath.row].rawValue,
                sectionImage: Legend.sectionImage[indexPath.row]
            )
            return sectionDescriptionCell
        default:
            sectionDescriptionCell.textLabel?.text = .failure
            return sectionDescriptionCell
        }
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
        let sectionLabel: UILabel = .init(
                frame: CGRect(
                    x: Constants.sectionLabelXAxis,
                    y: Constants.sectionLabelYAxis,
                    width: Constants.sectionLabelWidth,
                    height: Constants.sectionLabelHeight
                )
            )
        sectionLabel.textColor = .systemGray
        customHeaderView.addSubview(sectionLabel)
        switch section {
        case let sectionNumber:
            sectionLabel.text = String(
                describing: Legend.LegendName.allCases[sectionNumber].rawValue
            )
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
        static let sectionLabelXAxis: Int = 20
        static let sectionLabelYAxis: Int = 20
        static let sectionLabelLeadingOffset: Int = 20
        static let sectionLabelWidth: Int = Int(UIScreen.main.bounds.width) - 2 * (sectionLabelXAxis + sectionLabelLeadingOffset)
        static let sectionLabelHeight: Int = 23
        static let heightForFooterInSection: CGFloat = 0.0
        static let heightForHeaderInSection: CGFloat = 50.0
    }
}

