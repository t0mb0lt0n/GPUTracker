//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let infoStackView = UIStackView()
    
    let idView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 20))
        idLabel.textColor = .systemGray
        idLabel.text = "ID"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.layer.cornerRadius = 5
        view.addSubview(idLabel)
        view.backgroundColor = .orange
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
        return view
    }()
    
    let vendorView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 20))
        idLabel.textColor = .systemGray
        idLabel.text = "Vendor"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        view.backgroundColor = .orange
        return view
    }()
    
    let gpuCoresView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 20))
        idLabel.textColor = .systemGray
        idLabel.text = "gpuCores"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        view.backgroundColor = .orange
        return view
    }()
    
    let gpuNameView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "gpuName"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        view.backgroundColor = .orange
        return view
    }()
    
    let tmusView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "tmus"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let ropsView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "rops"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let lOneView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "l1"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let lTwoView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "l2"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let baseClockView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "baseclc"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let boostClockView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "boostclc"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let memClockView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "memclc"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let memSizeView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "memsize"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let memTypeView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "memType"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let busView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "bus"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let tdpView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "tdp"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let psuView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "psu"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let directXView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "directx"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let openGLView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "openGl"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let openCLView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "openCl"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let vulcanView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "vulcan"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let cudaView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "cuda"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let shaderView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 20, height: 10))
        idLabel.textColor = .systemGray
        idLabel.text = "sahder"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        addSubview(infoStackView)
        setupStackView()
        //setupSubViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
//    func setupSubViewConstraints() {
//        idView.translatesAutoresizingMaskIntoConstraints = false
//        vendorView.translatesAutoresizingMaskIntoConstraints = false
//        gpuCoresView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            idView.widthAnchor.constraint(equalToConstant: 100),
//            vendorView.widthAnchor.constraint(equalToConstant: 150),
//            gpuCoresView.widthAnchor.constraint(equalToConstant: 200),
//        ])
//    }
    
    func setupStackViews() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.backgroundColor = .green
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillEqually
        infoStackView.alignment = .fill
        infoStackView.spacing = 20
        addItemsToStackView()
        setupConstraintsForStackView()
    }
    
    private func addItemsToStackView() {
        let itemsForStackView: [UIView] = [idView,
                                           vendorView,
                                           gpuCoresView,
                                           gpuNameView,
                                           tmusView,
                                           ropsView,
                                           lOneView,
//                                           lTwoView,
//                                           baseClockView,
//                                           boostClockView,
//                                           memClockView,
//                                           memSizeView,
//                                           memTypeView,
//                                           busView,
//                                           tdpView,
//                                           psuView,
//                                           directXView,
//                                           openGLView,
//                                           openCLView,
//                                           vulcanView,
//                                           cudaView,
//                                           shaderView
                                                        ]
                                           
        
        for item in itemsForStackView {
            infoStackView.addArrangedSubview(item)
            print("subView added")
        }
    }
    
    private func setupConstraintsForStackView() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            infoStackView.heightAnchor.constraint(equalToConstant: 300),
            infoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            infoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
}
