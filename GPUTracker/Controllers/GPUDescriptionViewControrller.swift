//
//  GPUDescriptionViewControrller.swift
//  GPUTracker
//
//  Created by Alexander on 05.05.2023.
//

//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class GPUDescriptionViewControrller: UIViewController {
    lazy var mainView = view as? MainView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view = MainView()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}


