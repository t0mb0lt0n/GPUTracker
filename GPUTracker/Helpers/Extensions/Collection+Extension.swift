//
//  Collection+Extension.swift
//  GPUTracker
//
//  Created by Alexander on 24.03.2025.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
