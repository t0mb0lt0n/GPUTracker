//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    var generalSegmentData: Results<General>
    var boardsSegmentData: Results<BoardRevision>
    var selectedDataSource: Realm?
    var showLoading: ((Bool) -> Void)?
    var reloadClosure: (() -> Void)?
    
    var descriptionSegments: [String] = {
        [
        .general,
        .motherBoards,
        ]
    }()
    
    init(forItemWithRealmName name: String) {
        selectedDataSource = RealmService(withRealmName: name).data
        generalSegmentData = (selectedDataSource?.objects(General.self))!
        boardsSegmentData = (selectedDataSource?.objects(BoardRevision.self))!
    }
    
    func findPhotos() {
        
    }
}

//MARK: - Constants

extension ItemDetailsViewModel {
    private enum Constants {
    }
}
