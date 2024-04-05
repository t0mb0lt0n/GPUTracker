//
//  ItemListViewController.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import UIKit
import RealmSwift

final class ItemDetailsViewController: UIViewController {
    lazy var mainView = view as! ItemDetailsView
    let service = RealmService()
    
    override func loadView() {
        view = ItemDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Item List"
        navigationController?.isNavigationBarHidden = false
        mainView.backgroundColor = .white
    }
}



    

