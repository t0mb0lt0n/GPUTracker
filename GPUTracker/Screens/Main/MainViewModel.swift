//
//  MainViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import Foundation
import RealmSwift

final class MainViewModel {
    private(set) var isContentDownloading = false
    private var service: RealmService
     var microsoftSection: Results<MicrosoftProductList>?
     var sonySection: Results<SonyProductList>?
    var showLoading: ((Bool) -> Void)?
    var hideContent: (() -> Void)?
    var reloadClosure: (() -> Void)?
    var numberOfSections: Int {
        [
        service.data?.objects(MicrosoftProductList.self) as Any,
        service.data?.objects(SonyProductList.self) as Any
        ].count
    }
    
    var itemsInSection: [Int] {
        guard
            let microsoftItemsInSection = microsoftSection?.count,
            let sonyItemsInSection = sonySection?.count
        else {
            return [0,0]
        }
        return [
               microsoftItemsInSection,
               sonyItemsInSection
               ]
    }
    
    init(service: RealmService) {
        self.service = service
        guard
            let microsoftSection = self.service.data?.objects(MicrosoftProductList.self),
            let sonySection = self.service.data?.objects(SonyProductList.self)
        else { return }
              
        self.microsoftSection = microsoftSection
        self.sonySection = sonySection
    }
    
    func findPhotos() {
        reloadClosure!()
    }
    
    func handleLoadingEvent(_ isDownloading: Bool) {
        self.isContentDownloading = isDownloading
    }
}

//MARK: - Constants

extension MainViewModel {
    private enum Constants {
    }
}
