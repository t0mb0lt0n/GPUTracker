//
//  MainViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import Foundation
import RealmSwift

final class MainViewModel {
    private var service: RealmService
    let developerListDataSource: Results<DeveloperList>
    let microsoftSectionDataSource: Results<MicrosoftProductList>
    let sonySectionDataSource: Results<SonyProductList>
    let segaSectionDataSource: Results<SegaProductList>
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

    
    init(service: RealmService) {
        self.service = service
        developerListDataSource = self.service.data.objects(DeveloperList.self)
        microsoftSectionDataSource = self.service.data.objects(MicrosoftProductList.self)
        sonySectionDataSource = self.service.data.objects(SonyProductList.self)
        segaSectionDataSource = self.service.data.objects(SegaProductList.self)
    }
}
