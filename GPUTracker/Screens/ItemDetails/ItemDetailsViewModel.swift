//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift

final class ItemDetailsViewModel {
    let selectedSegmentIndex = Constants.selectedSegmentIndex
    var generalSegmentRealmData: Results<General>
    var boardsSegmentRealmData: Results<Boards>
    var reloadClosure: (() -> Void)?
    var currentRealm: Realm {
        didSet {
            print("didSet + reload")
            generalSegmentRealmData = currentRealm.objects(General.self)
            boardsSegmentRealmData = currentRealm.objects(Boards.self)
            reloadClosure?()
        }
    }

    var descriptionSegments: [String] = {
        [
        .generalSegmentHeader,
        .components,
        .otherComponentsSegmentHeader
        ]
    }()
    
    init(forItemWithRealmName name: String) {
        currentRealm = RealmService(withRealmName: name).data
        generalSegmentRealmData = currentRealm.objects(General.self)
        boardsSegmentRealmData = currentRealm.objects(Boards.self)
    }
}

//MARK: - Constants
extension ItemDetailsViewModel {
    private enum Constants {
        static let selectedSegmentIndex = 0
    }
}
