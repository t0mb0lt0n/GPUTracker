//
//  LegendDescription.swift
//  GPUTracker
//
//  Created by Alexander on 18.12.2024.
//
import UIKit

struct Legend {
    enum LegendName: String, CaseIterable {
        case statusLegend = "Online Status Description"
        case sectionLegend = "Sections Description"
    }
    static let sectionImage: [UIImage] = [
        .generalImage,
        .consoleComponentsImage,
        .motherboardComponentsImage,
        .controllersImage
    ]
    enum SectionDesccription: String, CaseIterable {
        case general = "General information."
        case consoleComponents = "Console components info."
        case motherboardComponents = "Detailed MB components info."
        case controllersImage = "Information about controllers."
    }
    enum StatusDescription: String, CaseIterable {
        case online = "All online services and functions are available."
        case partially = "Some services are disconnected, but the main ones are working."
        case offline = "All services are disconnected and unavailable."
    }
}

