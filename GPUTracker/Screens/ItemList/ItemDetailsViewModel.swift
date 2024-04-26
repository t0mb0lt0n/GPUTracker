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
    var boardsSegmentData: Results<Boards>
    var selectedDataSource: Realm? {
        didSet {
            generalSegmentData = (selectedDataSource?.objects(General.self))!
            boardsSegmentData = (selectedDataSource?.objects(Boards.self))!
            reloadClosure!()
        }
    }
    var showLoading: ((Bool) -> Void)?
    var reloadClosure: (() -> Void)?
    var dataSourceUpdate: (() -> Void)?
    
    var descriptionSegments: [String] = {
        [
        .general,
        .motherBoards,
        ]
    }()
    
    init(forItemWithRealmName name: String) {
        selectedDataSource = RealmService(withRealmName: name).data
        generalSegmentData = (selectedDataSource?.objects(General.self))!
        boardsSegmentData = (selectedDataSource?.objects(Boards.self))!
    }
}

//MARK: - Constants

extension ItemDetailsViewModel {
    private enum Constants {
    }
}
