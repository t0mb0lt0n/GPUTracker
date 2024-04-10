//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    var dataSourceForGeneral: Results<GeneralTestDescription>
    var selectedDataSource = RealmService.shared.realms[0]
    var showLoading: ((Bool) -> Void)?
    var reloadClosure: (() -> Void)?
    
//    var numberOfSections: Int {
//        RealmService.shared.realms.count
//    }
    
    var descriptionSegments: [String] = {
        [
        .general,
        .motherBoards,
        ]
    }()
    
    init() {
        self.dataSourceForGeneral = selectedDataSource.objects(GeneralTestDescription.self)
    }
    
//    init() {
//    }

    
    func findPhotos() {
        
    }
}

//MARK: - Constants

extension ItemDetailsViewModel {
    private enum Constants {
    }
}
