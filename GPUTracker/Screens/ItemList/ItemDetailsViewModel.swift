//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    var dataSourceForGeneral: Results<General>
    var dataSourceForBoards: Results<BoardRevision>
    var selectedDataSource = RealmService.shared.realms[0]
    var selectedDataSource2 = RealmService.shared.realms[1]
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
        //self.dataSourceForGeneral = selectedDataSource.objects(General.self)
        self.dataSourceForGeneral = selectedDataSource.objects(General.self)
        self.dataSourceForBoards = selectedDataSource2.objects(BoardRevision.self)
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
