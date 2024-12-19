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
    let numberOfSections: Int = Constants.numberOfSections
    let numbersOfRowsInStatusSection: Int = Legend.StatusDescription.allCases.count
    let numbersOfRowsInSectionDescription: Int = Legend.SectionDesccription.allCases.count
    
    func updateData() {
        reloadClosure?()
    }
    
    @objc func infoButtonTapped() {
        infoButtonClosure?()
    }
}

//MARK: - Constants
extension InfoViewModel {
    private enum Constants {
        static let numberOfSections: Int = 2
    }
}
