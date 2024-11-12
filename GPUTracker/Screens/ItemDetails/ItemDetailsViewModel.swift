//
//  ItemDetailsViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import Foundation
import RealmSwift
import UIKit

final class ItemDetailsViewModel {
    let selectedSegmentIndex = Constants.selectedSegmentIndex
    var generalSegmentRealmData: Results<General>
    var consoleComponentsSegmentRealmData: Results<Components>
    var motherboardComponentsSegmentRealmData: Results<Components>
    var reloadClosure: (() -> Void)?
    var currentRealm: Realm {
        didSet {
            print("didSet + reload")
            generalSegmentRealmData = currentRealm.objects(General.self)
            componentsSegmentRealmData = currentRealm.objects(Components.self)
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
    
    var segmentImages: [UIImage] = {
        [
            .generalImage,
            .consoleComponentsImage,
            .motherboardComponentsImage
        ]
    }()
    
    init(forItemWithRealmName name: String) {
        currentRealm = RealmService(withRealmName: name).data
        generalSegmentRealmData = currentRealm.objects(General.self)
        componentsSegmentRealmData = currentRealm.objects(Components.self)
    }
}

//MARK: - Constants
extension ItemDetailsViewModel {
    private enum Constants {
        static let selectedSegmentIndex = 0
    }
}
