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
        mainView.segmentDidChangedClosure = { [weak self] in
            self?.segmentChanged()
        }
    }
    
    func segmentChanged() {
        let contentOffset = mainView.itemDescriotionView.testLabel1.frame.width
        let segmentIndex = mainView.segmentedControll.selectedSegmentIndex
        mainView.itemDescriotionView.testScrollView.setContentOffset(CGPoint(x: Int(contentOffset) * segmentIndex, y: 0), animated: true)
    }
}



    

