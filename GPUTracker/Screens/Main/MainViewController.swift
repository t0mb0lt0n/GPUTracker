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
        self.viewModel = MainViewModel(service: .init(withRealmName: "mainProductList"))
        self.detailsVC = detailsVC
        super.init(nibName: nil, bundle: nil)
        delagate = detailsVC
        splitViewController?.delegate = self
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
        title = "mainVC"
        navigationController?.isNavigationBarHidden = false
        setupTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .secondarySystemBackground
        mainView.backgroundColor = .secondarySystemBackground
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
            return .microsoft
        case 1:
            return .sony
        default:
            return ""
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
        default:
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cellIdentifier = "Apple designed cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        cell = UITableViewCell(
                style: .value1,
                reuseIdentifier: cellIdentifier
            )
        switch indexPath.section {
        case 0:
            cell?.textLabel?.text = viewModel.microsoftSection[indexPath.row].productName
        case 1:
            cell?.textLabel?.text = viewModel.sonySection[indexPath.row].productName
        default:
            cell?.textLabel?.text = .failure
        }
        
        cell?.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return cell!
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
        let manufacturerNameLabel = UILabel(
            frame: CGRect(
                x: 5,
                y: 20,
                width: 150,
                height: 15
            )
        )
        manufacturerNameLabel.textColor = .black
        manufacturerNameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        customHeaderView.addSubview(manufacturerNameLabel)
        
        switch section {
        case 0:
            manufacturerNameLabel.text = .microsoft
        case 1:
            manufacturerNameLabel.text = .sony
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
            resignFirstResponder()
        case 1:
            delagate?.updateData(forItemIndex: RealmConfigurations.itemIndexName[indexPath.section][indexPath.row])
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
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
    }
}

