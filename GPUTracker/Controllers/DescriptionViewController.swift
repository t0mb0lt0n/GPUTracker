//
//  DescriptionViewController.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionViewController: UIViewController {
    lazy var mainView = view as? DescriptionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = DescriptionView()
        mainView?.backgroundColor = .secondarySystemBackground
        mainView?.closeButtonPressedClosure = { [weak self] in
            self?.cancelButtonPressed()
        }
    }
}

extension DescriptionViewController {
    func cancelButtonPressed() {
        dismiss(animated: true)
    }
}


