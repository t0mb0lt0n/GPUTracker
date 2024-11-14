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
    var generalSegmentDataSource: Results<General>
    var consoleComponentsSegmentDataSource: Results<Components>
    var motherboardComponentsSegmentDataSource: Results<MotherboardComponents>
    var reloadClosure: (() -> Void)?
    var currentRealm: Realm {
        didSet {
            print("didSet + reload")
            generalSegmentDataSource = currentRealm.objects(General.self)
            consoleComponentsSegmentDataSource = currentRealm.objects(Components.self)
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
            .motherboardComponentsImage,
            .historyImage
        ]
    }()
    
    init(forItemWithRealmName name: String) {
        currentRealm = RealmService(withRealmName: name).data
        generalSegmentDataSource = currentRealm.objects(General.self)
        consoleComponentsSegmentDataSource = currentRealm.objects(Components.self)
        motherboardComponentsSegmentDataSource = currentRealm.objects(MotherboardComponents.self)
    }
}

//MARK: - Constants
extension ItemDetailsViewModel {
    private enum Constants {
        static let selectedSegmentIndex = 0
    }
}
