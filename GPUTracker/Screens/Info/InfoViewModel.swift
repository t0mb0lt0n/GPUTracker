//
//  InfoViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//
import Foundation

final class InfoViewModel {
    private enum Constants {
        static let numberOfSections: Int = 2
    }
    
    var dismissButtonClosure: (() -> Void)?
    let numberOfSections: Int = Constants.numberOfSections
    let numbersOfRowsInStatusSection: Int = Legend.StatusDescription.allCases.count
    let numbersOfRowsInSectionDescription: Int = Legend.SectionDescription.allCases.count
        
    func dismissButtonTapped() {
        dismissButtonClosure?()
    }
}
