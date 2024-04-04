//
//  MainViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import Foundation
import RealmSwift

final class MainViewModel {
    private(set) var isContentDownloading = false
    var showLoading: ((Bool) -> Void)?
    var hideContent: (() -> Void)?
    var reloadClosure: (() -> Void)?
    
    var numberOfSections: Int {
        RealmService.shared.realms.count
    }
    
    var itemsInSection: [String: Int] {
        [
        .microsoft: RealmService.shared.realms[0].objects(ProductList.self).count,
        .sony: RealmService.shared.realms[1].objects(ProductList.self).count
        ]
    }
    
    init() {}
    
    func findPhotos() {
        
    }
    
    func handleLoadingEvent(_ isDownloading: Bool) {
        self.isContentDownloading = isDownloading
    }
}

//MARK: - Constants

extension MainViewModel {
    private enum Constants {
        static let request: String = "city"
        static let startPage = 1
        static let pageSize = 5
        static let microsoftKey: String = "Microsoft"
        static let sonyKey: String = "Sony"
    }
}
