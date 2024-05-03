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
    var microsoftSection: Results<MicrosoftProductList>
    var sonySection: Results<SonyProductList>
    var segaSection: Results<SegaProductList>
    var showLoading: ((Bool) -> Void)?
    var hideContent: (() -> Void)?
    var reloadClosure: (() -> Void)?
    var numberOfSections: Int {
        [
        service.data.objects(MicrosoftProductList.self),
        service.data.objects(SonyProductList.self),
        service.data.objects(SegaProductList.self)
        ].count
    }
    
    var itemsInSection: [Int] {
        [
        microsoftSection.count,
        sonySection.count,
        segaSection.count
        ]
    }
    
    init(service: RealmService) {
        self.service = service
        microsoftSection = self.service.data.objects(MicrosoftProductList.self)
        sonySection = self.service.data.objects(SonyProductList.self)
        segaSection = self.service.data.objects(SegaProductList.self)
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
