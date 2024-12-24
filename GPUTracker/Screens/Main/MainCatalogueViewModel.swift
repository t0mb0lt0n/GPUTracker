//
//  MainViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import Foundation
import RealmSwift

final class MainCatalogueViewModel {
    private enum Constatnts {
        static let defaultNumberOfSections: Int = 0
    }
    
    private var service: RealmService
    var developerListDataSource: Results<DeveloperList>
    //var microsoftSectionDataSource: Results<MicrosoftProductList>
    //var sonySectionDataSource: Results<SonyProductList>
    //var segaSectionDataSource: Results<SegaProductList>
    var reloadClosure: (() -> Void)?
    var infoButtonClosure: (() -> Void)?
//    var numberOfSections: Int {
//        developerListDataSource.count
//    }
    
    func updateData() {
        reloadClosure?()
    }
    
    func setupDataSources() {
        guard let data = service.data else {
            return
        }
        developerListDataSource = data.objects(DeveloperList.self)
        //microsoftSectionDataSource = data.objects(MicrosoftProductList.self)
        //sonySectionDataSource = data.objects(SonyProductList.self)
        //segaSectionDataSource = data.objects(SegaProductList.self)
    }
    
    @objc func infoButtonTapped() {
        infoButtonClosure?()
    }
    
    init(withService service: RealmService) {
        self.service = service
        setupDataSources()
    }
}
