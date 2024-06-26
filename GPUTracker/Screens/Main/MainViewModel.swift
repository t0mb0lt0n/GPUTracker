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
    var microsoftSectionDataSource: Results<MicrosoftProductList>
    var sonySectionDataSource: Results<SonyProductList>
    var segaSectionDataSource: Results<SegaProductList>
    var showLoading: ((Bool) -> Void)?
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
        microsoftSectionDataSource.count,
        sonySectionDataSource.count,
        segaSectionDataSource.count
        ]
    }
    
    func updateData() {
        reloadClosure!()
    }
    
    init(service: RealmService) {
        self.service = service
        microsoftSectionDataSource = self.service.data.objects(MicrosoftProductList.self)
        sonySectionDataSource = self.service.data.objects(SonyProductList.self)
        segaSectionDataSource = self.service.data.objects(SegaProductList.self)
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
