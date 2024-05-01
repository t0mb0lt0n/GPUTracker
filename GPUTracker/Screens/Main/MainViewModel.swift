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
        let sectionsSource = RealmService(withRealmName: .xbox360Realm).data
        return sectionsSource!.objects(General.self).count
    }
    
    var itemsInSection: [String: Int] {
        [
        .microsoft: 5,
        .sonyRealm: 5
        ]
    }
    
    init() {}
    
    func findPhotos() {
        reloadClosure!()
    }
    
    func handleLoadingEvent(_ isDownloading: Bool) {
        self.isContentDownloading = isDownloading
    }
}

//MARK: - Constants

extension MainViewModel {
    private enum Constants {
    }
}
