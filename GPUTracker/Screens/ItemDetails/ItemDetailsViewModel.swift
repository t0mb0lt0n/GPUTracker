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
    let initialSegmentIndex = Constants.initialSegmentIndex
    var generalDataSource: Results<General>
    var consoleComponentsDataSource: Results<Components>
    var motherboardComponentsDataSource: Results<MotherboardComponents>
    var reloadClosure: (() -> Void)?
    var currentRealm: Realm {
        didSet {
            print("didSet + reload")
            generalDataSource = currentRealm.objects(General.self)
            consoleComponentsDataSource = currentRealm.objects(Components.self)
            motherboardComponentsDataSource = currentRealm.objects(MotherboardComponents.self)
            reloadClosure?()
        }
    }
    
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
        generalDataSource = currentRealm.objects(General.self)
        consoleComponentsDataSource = currentRealm.objects(Components.self)
        motherboardComponentsDataSource = currentRealm.objects(MotherboardComponents.self)
    }
}

//MARK: - Constants
extension ItemDetailsViewModel {
    private enum Constants {
        static let initialSegmentIndex = 0
    }
}
