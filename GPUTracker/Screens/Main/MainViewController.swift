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
    func updateData(forItemIndex itemIndexName: String)
}

final class MainViewController: UIViewController {
    lazy var mainView = view as! MainView
    private let viewModel: MainViewModel
    weak var delagate: RealmUpdateDelegate?
    
    init() {
        self.viewModel = MainViewModel(
            service: .init(
                withRealmName: .mainProductListRealm
            )
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView()
        setupViewModel()
        setupMainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .mainCatalogue
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        viewModel.updateData()
    }
    
    private func setupMainView() {
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        mainView.backgroundColor = .tertiarySystemGroupedBackground
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
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return .microsoftHeader
        case 1:
            return .sonyHeader
        default:
            return .failurePlaceholder
        }
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
            return viewModel.itemsInSection[Constants.microsoftSectionNumber]
        case 1:
            return viewModel.itemsInSection[Constants.sonySectionNumber]
        case 2:
            return viewModel.itemsInSection[Constants.segaSectionNumber]
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
        
        switch indexPath.section {
        case 0:
            cell.descriptionNameLabel.text = viewModel.microsoftSectionDataSource[indexPath.row].productName
            cell.descriptionValueTextView.text = viewModel.microsoftSectionDataSource[indexPath.row].shortDetails
        case 1:
            cell.descriptionNameLabel.text = viewModel.sonySectionDataSource[indexPath.row].productName
            cell.descriptionValueTextView.text = viewModel.sonySectionDataSource[indexPath.row].shortDetails
        case 2:
            cell.descriptionNameLabel.text = viewModel.segaSectionDataSource[indexPath.row].productName
            cell.descriptionValueTextView.text = viewModel.segaSectionDataSource[indexPath.row].shortDetails
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
        50
    }
    //setup footer in section height
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        0
    }
    //custom header view for table view
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let customHeaderView = UIView()
        let developerNameLabel = UILabel(
            frame: CGRect(
                x: 15,
                y: 20,
                width: 150,
                height: 23
            )
        )
        developerNameLabel.textColor = .gray
        customHeaderView.addSubview(developerNameLabel)
        
        switch section {
        case 0:
            developerNameLabel.text = .microsoftHeader
        case 1:
            developerNameLabel.text = .sonyHeader
        case 2:
            developerNameLabel.text = .segaHeader
        default:
            return nil
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
            delagate?.updateData(
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
            )
            tableView.reloadData()
        case 1:
            delagate?.updateData(
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
            )
        case 2:
            delagate?.updateData(
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
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
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
            )
        case 1:
            delagate?.updateData(
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
            )
        case 2:
            delagate?.updateData(
                forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row]
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
