//
//  InfoViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//
import Foundation

final class InfoViewModel {
    private var service: RealmService
    var reloadClosure: (() -> Void)?
    var infoButtonClosure: (() -> Void)?
    var numberOfSections: Int {
        [
        service.data.objects(MicrosoftProductList.self),
        service.data.objects(SonyProductList.self),
        service.data.objects(SegaProductList.self)
        ].count
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
