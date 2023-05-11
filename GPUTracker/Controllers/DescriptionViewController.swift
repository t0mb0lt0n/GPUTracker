//
//  DescriptionViewController.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionViewController: UIViewController {
    private lazy var mainView = view as? DescriptionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = DescriptionView()
        mainView?.backgroundColor = .secondarySystemBackground
    }
}
    

