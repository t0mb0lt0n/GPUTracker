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
    var componentsSegmentRealmData: Results<Components>
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
            .genegalImage,
            .genegalImage,
            .genegalImage
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
