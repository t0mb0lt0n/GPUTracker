//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import SwiftUI
import RealmSwift

protocol RealmUpdateDelegate: AnyObject {
    func updateData(forItemWithName itemIndexName: String)
}

final class MainViewController: UIViewController {
    lazy var mainView = view as! MainView
    private let viewModel: MainViewModel
    weak var delagate: RealmUpdateDelegate?
    var itemDetailsVC: ItemDetailsViewController?
    
    init() {
        viewModel = MainViewModel(
            service: .init(
                withRealmName: .mainProductListRealm
            )
        )
        itemDetailsVC = .init(
            withViewModel: .init(
                forItemWithRealmName: .playstation3
            ),
            andBarTitle: .playstation3
        )
        super.init(nibName: nil, bundle: nil)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delagate = itemDetailsVC
        setupMainView()
    }
    
    override func viewDidLayoutSubviews() {
        viewModel.updateData()
    }
    
    private func setupMainView() {
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        mainView.backgroundColor = .tertiarySystemGroupedBackground
        setupNavigationBarStyle(
            isLarge: true,
            title: .mainCatalogue,
            titleColor: .black
        )
        itemDetailsVC?.navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupViewModel() {
        viewModel.reloadClosure = {
            self.reloadTableView()
        }
    }
    
    private func reloadTableView() {
        mainView.mainTableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(
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
            return viewModel.microsoftSectionDataSource.count
        case 1:
            return viewModel.sonySectionDataSource.count
        case 2:
            return viewModel.segaSectionDataSource.count
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "\(MainCell.self)",
            for: indexPath
        ) as? MainCell else {
            fatalError("Cell dequeue error")
        }
        cell.selectionStyle = .default
        cell.accessoryType = .disclosureIndicator
        switch indexPath.section {
        case 0:
            cell.configurateCell(
                descriptionName: viewModel.microsoftSectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.microsoftSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.microsoftSectionDataSource[indexPath.row].onlineStatus
            )
        case 1:
            cell.configurateCell(
                descriptionName: viewModel.sonySectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.sonySectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.microsoftSectionDataSource[indexPath.row].onlineStatus
            )
        case 2:
            cell.configurateCell(
                descriptionName: viewModel.segaSectionDataSource[indexPath.row].productName,
                descriptionValue: viewModel.segaSectionDataSource[indexPath.row].shortDetails,
                onlineStatus: viewModel.microsoftSectionDataSource[indexPath.row].onlineStatus
            )
        default:
            cell.textLabel?.text = .failurePlaceholder
        }
        return cell
    }
    
    //setup header in section height
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        Constants.heightForHeaderInSection
    }
    //setup footer in section height
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        Constants.heightForFooterInSection
    }
    //custom header view for table view
    func tableView(
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
        developerNameLabel.backgroundColor = .systemBlue
        switch section {
        case let sectionNumber:
            developerNameLabel.text = viewModel.developerListDataSource[sectionNumber].developerName
        }
        return customHeaderView
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        switch indexPath.section {
        case 0:
            self.delagate?.updateData(
                forItemWithName: RealmConfigurations.itemList[indexPath.section][indexPath.row]
            )
            guard let itemDetailsVC else { return }
            navigationController?.pushViewController(itemDetailsVC, animated: true)
        case 1:
            print("")
        case 2:
            delagate?.updateData(
                forItemWithName: RealmConfigurations.itemList[indexPath.section][indexPath.row]
            )
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        accessoryButtonTappedForRowWith indexPath: IndexPath
    ) {
        switch indexPath.section {
        case 0:
            delagate?.updateData(
                forItemWithName: RealmConfigurations.itemList[indexPath.section][indexPath.row]
            )
        case 1:
            delagate?.updateData(
                forItemWithName: RealmConfigurations.itemList[indexPath.section][indexPath.row]
            )
        case 2:
            delagate?.updateData(
                forItemWithName: RealmConfigurations.itemList[indexPath.section][indexPath.row]
            )
        default:
            break
        }
    }
}

extension MainViewController {
    private enum Constants {
        static let microsoftSectionNumber: Int = 0
        static let sonySectionNumber: Int = 1
        static let segaSectionNumber: Int = 2
        static let developerNameXAxis: Int = 20
        static let developerNameYAxis: Int = 20
        static let developerNameBaseLeadingOffset: Int = 20
        static let developerNameWidth: Int = Int(UIScreen.main.bounds.width) - 2 * (developerNameXAxis + developerNameBaseLeadingOffset)
        static let developerNameHeight: Int = 23
        static let heightForFooterInSection: CGFloat = 0
        static let heightForHeaderInSection: CGFloat = 50

    }
}

//
////MARK: - UIKit Preview
//struct ContentViewPreviewss: PreviewProvider {
//    static var previews: some View {
//        ViewControllerContainer().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//    }
//    
//    struct ViewControllerContainer: UIViewControllerRepresentable {
//        func makeUIViewController(context: Context) -> some UIViewController {
//            UINavigationController(rootViewController: MainViewController())
//        }
//        
//        func updateUIViewController(
//            _ uiViewController: UIViewControllerType,
//            context: Context
//        ) {}
//    }
//}
