//
//  InfoViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//
import Foundation

final class InfoViewModel {
    var reloadClosure: (() -> Void)?
    var infoButtonClosure: (() -> Void)?
    let numberOfSections = Constants.numberOfSections
    
    func updateData() {
        reloadClosure?()
    }
    
    @objc func infoButtonTapped() {
        infoButtonClosure?()
    }

    
    init() {
        
       
    }
}

//MARK: - Constants
extension InfoViewModel {
    private enum Constants {
        static let numberOfSections: Int = 1
    }
}
