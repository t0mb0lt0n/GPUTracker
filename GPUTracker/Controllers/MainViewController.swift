//
//  ViewController.swift
//  GPUTracker
//
//  Created by Alexander on 13.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    lazy var mainView = view as! MainView

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
       
    }
    
    
}

