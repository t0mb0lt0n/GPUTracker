//
//  GPUDescriptionViewControrller.swift
//  GPUTracker
//
//  Created by Alexander on 05.05.2023.
//

import UIKit

class GPUDescriptionViewControrller: UIViewController {
    lazy var mainView = view as? GPUDescriptionView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view = GPUDescriptionView()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}


