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
    private enum Constants {
        static let initialSegmentIndex: Int = 0
    }
    let initialSegmentIndex = Constants.initialSegmentIndex
    var generalDataSource: Results<General>?
    var consoleComponentsDataSource: Results<Components>?
    var motherboardComponentsDataSource: Results<MotherboardComponents>?
    var controllersDataSource: Results<Controllers>?
    var reloadClosure: (() -> Void)?
    let segmentImages: [UIImage] = {
        [
        .generalImage,
        .consoleComponentsImage,
        .motherboardComponentsImage,
        .controllersImage
        ]
    }()
    var currentRealm: Realm? {
        didSet {
            guard let data = currentRealm else {
                return
            }
            generalDataSource = data.objects(General.self)
            consoleComponentsDataSource = data.objects(Components.self)
            motherboardComponentsDataSource = data.objects(MotherboardComponents.self)
            controllersDataSource = data.objects(Controllers.self)
            reloadClosure?()
            print("ereloaded")
        }
    }
}
