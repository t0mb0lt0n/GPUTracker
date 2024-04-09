//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    var dataSourceForGeneral: Results<ProductList>
    var selectedDataSource = RealmService.shared.realms[1]
    var showLoading: ((Bool) -> Void)?
    var reloadClosure: (() -> Void)?
    
//    var numberOfSections: Int {
//        RealmService.shared.realms.count
//    }
    
    var descriptionSegments: [String] = {
        [
        .general,
        .gpuVariants,
        .cpuVariants,
        .motherBoards,
        .otherComponents
        ]
    }()
    
    init() {
        self.dataSourceForGeneral = selectedDataSource.objects(ProductList.self)
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
