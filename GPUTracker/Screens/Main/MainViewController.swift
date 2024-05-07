//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit
import RealmSwift

protocol UpdateRealmDelegate: AnyObject {
    func updateData(forItemIndex itemIndexName: String)
}

final class MainViewController: UIViewController {
    lazy var mainView = view as! MainView
    var detailsVC: ItemDetailsViewController?
    private let viewModel: MainViewModel
    weak var delagate: UpdateRealmDelegate?
    let tableView = UITableView(
        frame: .zero,
        style: .grouped
    )
    
    
    init(with detailsVC: ItemDetailsViewController) {
        self.viewModel = MainViewModel(service: .init(withRealmName: .mainProductListRealm))
        self.detailsVC = detailsVC
        super.init(nibName: nil, bundle: nil)
        delagate = detailsVC
        splitViewController?.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MainView()
        setupViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .mainCatalogue
        navigationController?.isNavigationBarHidden = false
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.register(
            MainCell.self,
            forCellReuseIdentifier: "\(MainCell.self)"
        )
        tableView.backgroundColor = .secondarySystemBackground
        mainView.backgroundColor = .secondarySystemBackground
        tableView.estimatedRowHeight = 10
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    private func setupViewModel() {
        viewModel.reloadClosure = {
            
        }
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
        
        switch indexPath.section {
        case 0:
            //cell.descriptionNameLabel.text = viewModel.microsoftSection[indexPath.row].productName
            //cell.descriptionValueTextView.text = viewModel.microsoftSection[indexPath.row].shortDetails
            //tableView.reloadData()
            print()
        case 1:
//            cell.textLabel?.text = viewModel.sonySection[indexPath.row].productName
//            cell.detailTextLabel?.text = viewModel.microsoftSection[indexPath.row].shortDetail
            print()
        case 2:
//            cell.textLabel?.text = viewModel.segaSection[indexPath.row].productName
//            cell.detailTextLabel?.text = viewModel.segaSection[indexPath.row].shortDetails
            print()
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
        //manufacturerNameLabel.font = .systemFont(ofSize: 17, weight: .regular)
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
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
            tableView.reloadData()
        case 1:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
        case 2:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
            resignFirstResponder()
        case 1:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
        case 2:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
        default:
            break
        }
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 200// Например, 100 для каждой ячейки
//    }

}



extension MainViewController {
    private func setupTableView() {
        mainView.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 150
            ),
            tableView.leadingAnchor.constraint(
                equalTo: mainView.safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UISplitViewControllerDelegate
extension MainViewController: UISplitViewControllerDelegate {
    override func collapseSecondaryViewController(_ secondaryViewController: UIViewController, for splitViewController: UISplitViewController) {
//        splitViewController.collapseSecondaryViewController(self, for: detailsVC!)
    }
    
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController
    ) -> Bool {
        true
    }
}

extension MainViewController {
    private enum Constants {
        static let microsoftSectionNumber: Int = 0
        static let sonySectionNumber: Int = 1
        static let segaSectionNumber: Int = 2

    }
}

