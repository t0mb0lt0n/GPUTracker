//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    var generalSegmentRealmData: Results<General>
    var boardsSegmentRealmData: Results<Boards>
    var currentRealm: Realm? {
        didSet {
            generalSegmentRealmData = (currentRealm?.objects(General.self))!
            boardsSegmentRealmData = (currentRealm?.objects(Boards.self))!
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
        currentRealm = RealmService(withRealmName: name).data
        generalSegmentRealmData = (currentRealm?.objects(General.self))!
        boardsSegmentRealmData = (currentRealm?.objects(Boards.self))!
    }
}

//MARK: - Constants

extension ItemDetailsViewModel {
    private enum Constants {
    }
}
