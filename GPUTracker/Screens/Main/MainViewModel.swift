//
//  MainViewModel.swift
//  GPUTracker
//
//  Created by Alexander on 04.04.2024.
//

import Foundation
import RealmSwift

final class MainViewModel {
    private let service: RealmService
    //private(set) var photos: [UnsplashPhoto] = .init()
    private(set) var isContentDownloading = false
    var showLoading: ((Bool) -> Void)?
    private var currentPage = Constants.startPage
    var hideContent: (() -> Void)?
    var reloadClosure: (() -> Void)?
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfItems: Int {
        service.microsoftRealm.objects(ProductList.self).count
    }
    
    init(service: RealmService) {
        self.service = service
    }
    
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
    }
}
