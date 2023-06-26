//
//  DescriptionViewController.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionViewController: UIViewController {
    lazy var mainView = view as! DescriptionView
    lazy var specLabels = [mainView.idLabel,
                      mainView.vendorLabel,
                      mainView.gpuCoresLabel,
                      mainView.gpuNameLabel,
                      mainView.tmusLabel,
                      mainView.ropsLabel,
                      mainView.lOneLabel,
                      mainView.lTwoLabel,
                      mainView.baseClockLabel,
                      mainView.boostClockLabel,
                      mainView.memClockLabel,
                      mainView.memSizeLabel,
                      mainView.memTypeLabel,
                      mainView.busLabel,
                      mainView.tdpLabel,
                      mainView.psuLabel,
                      mainView.directXLabel,
                      mainView.openGLLabel,
                      mainView.openCLLabel,
                      mainView.vulcanLabel,
                      mainView.cudaLabel,
                      mainView.shaderLabel,
                      mainView.releaseDateLabel,
                      mainView.processSizeLabel,
                      mainView.architectureLabel,
                      mainView.fp32FloatLabel,
                      mainView.foundryLabel,
                      mainView.crystalSizeLabel]
    
    override func loadView() {
        view = DescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .secondarySystemBackground
        mainView.closeButtonPressedClosure = { [weak self] in
            self?.cancelButtonPressed()
        }
    }
}

extension DescriptionViewController {
    func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    func configurateLabels(prefix: [String], data: [String?]) {
        let specLabels = [mainView.idLabel,
                          mainView.vendorLabel,
                          mainView.gpuCoresLabel,
                          mainView.gpuNameLabel,
                          mainView.tmusLabel,
                          mainView.ropsLabel,
                          mainView.lOneLabel,
                          mainView.lTwoLabel,
                          mainView.baseClockLabel,
                          mainView.boostClockLabel,
                          mainView.memClockLabel,
                          mainView.memSizeLabel,
                          mainView.memTypeLabel,
                          mainView.busLabel,
                          mainView.tdpLabel,
                          mainView.psuLabel,
                          mainView.directXLabel,
                          mainView.openGLLabel,
                          mainView.openCLLabel,
                          mainView.vulcanLabel,
                          mainView.cudaLabel,
                          mainView.shaderLabel,
                          mainView.releaseDateLabel,
                          mainView.processSizeLabel,
                          mainView.architectureLabel,
                          mainView.fp32FloatLabel,
                          mainView.foundryLabel,
                          mainView.crystalSizeLabel]
        
        for (index, value) in specLabels.enumerated() {
            value.text = "\(prefix[index])  \(data[index] ?? "data field is empty")"
        }
    }
    
    func changeLabelAttributes(inLabels labels: [UILabel], inStrings strings: [String?]) {
        for (index, value) in labels.enumerated() {
            guard let fullText = labels[index].text, let changeText = strings[index] else {
                break
            }
            value.labelTextAttributesChange(fullText: fullText, changeText: changeText)
        }
    }
}


