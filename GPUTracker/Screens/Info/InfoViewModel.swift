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
    var numberOfSections: Int {
        1
    }
    
    func updateData() {
        reloadClosure?()
    }
    
    @objc func infoButtonTapped() {
        infoButtonClosure?()
    }

    
    init() {
        
       
    }
}
