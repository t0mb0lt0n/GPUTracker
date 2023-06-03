//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let leftInfoStackView       = UIStackView()
    let centralInfoStackView    = UIStackView()
    let rightInfoStackView      = UIStackView()
    
    let testView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let testView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let testView3: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let testLabel1: UILabel = {
        let Label = UILabel(frame: CGRect(x: 10, y: 9, width: 200 , height: 20))
        Label.textColor = .black
        Label.backgroundColor = .red
        Label.text = "ID"
        Label.font = .systemFont(ofSize: 20, weight: .light)
        Label.layer.borderWidth = 3
        
        return Label
    }()

    
    let idView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 9, width: 200 , height: 20))
//        idLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            idLabel.topAnchor.constraint(equalTo: view.topAnchor),
//            idLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        idLabel.textColor = .black
        //idLabel.backgroundColor = .red
        idLabel.text = "ID"
        idLabel.font = .systemFont(ofSize: 20, weight: .light)
        idLabel.layer.borderWidth = 3
        view.layer.cornerRadius = 7
        view.addSubview(idLabel)
        //view.backgroundColor = .orange
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let vendorView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 9, width: 200 , height: 20))
        idLabel.textColor = .black
        idLabel.text = "Vendor"
        idLabel.font = .systemFont(ofSize: 15, weight: .light)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.addSubview(idLabel)
        return view
    }()
    
    let gpuCoresView: UIView = {
        let view = UIView()
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 50, height: 20))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        let idLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 20, height: 10))
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
        addSubview(leftInfoStackView)
        addSubview(centralInfoStackView)
        addSubview(rightInfoStackView)
        addSubview(testLabel1)
        setupStackViews()
        setupLabelConstraints()
        //setupSubViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    
    func setupLabelConstraints() {
        testLabel1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testLabel1.topAnchor.constraint(equalTo: testView.topAnchor, constant: 10),
            testLabel1.leadingAnchor.constraint(equalTo: testView.leadingAnchor, constant: 10),
            testLabel1.trailingAnchor.constraint(equalTo: testView.trailingAnchor, constant: -3)
        ])
    }
    
    func setupStackViews() {
        leftInfoStackView.translatesAutoresizingMaskIntoConstraints     = false
        centralInfoStackView.translatesAutoresizingMaskIntoConstraints  = false
        rightInfoStackView.translatesAutoresizingMaskIntoConstraints    = false
        
        
        leftInfoStackView.axis            = .vertical
        leftInfoStackView.distribution    = .fillEqually
        leftInfoStackView.alignment       = .fill
        leftInfoStackView.spacing         = 5
        
        centralInfoStackView.backgroundColor = .green
        centralInfoStackView.axis            = .vertical
        centralInfoStackView.distribution    = .fillEqually
        centralInfoStackView.alignment       = .fill
        centralInfoStackView.spacing         = 5
        
        rightInfoStackView.backgroundColor = .green
        rightInfoStackView.axis            = .vertical
        rightInfoStackView.distribution    = .fillEqually
        rightInfoStackView.alignment       = .fill
        rightInfoStackView.spacing         = 5
        
        
        addItemsToStackView()
        setupConstraintsForStackView()
    }
    
    private func addItemsToStackView() {
        let itemsForLeftStackView: [UIView] = [ testView,
                                                testView2,
        testView3]
                                                //idView,
//                                               vendorView,
//                                               gpuCoresView,
//                                               gpuNameView,
//                                               tmusView,
//                                               ropsView,
//                                               lOneView]
        
        let itemsForeCentralStackView: [UIView] = [lTwoView,
                                                   baseClockView,
                                                   boostClockView,
                                                   memClockView,
                                                   memSizeView,
                                                   memTypeView,
                                                   busView]
        
        let itemsForRightStackView: [UIView] = [tdpView,
                                                psuView,
                                                directXView,
                                                openGLView,
                                                openCLView,
                                                vulcanView,
                                                cudaView,
                                                shaderView]
        
        for item in itemsForLeftStackView {
            leftInfoStackView.addArrangedSubview(item)
            print("subView added")
        }
        
        for item in itemsForeCentralStackView {
            centralInfoStackView.addArrangedSubview(item)
        }
        
        for item in itemsForRightStackView {
            rightInfoStackView.addArrangedSubview(item)
        }
    }
    
    private func setupConstraintsForStackView() {
        leftInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            leftInfoStackView.heightAnchor.constraint(equalToConstant: 300),
            leftInfoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 3),
            //leftInfoStackView.widthAnchor.constraint(equalToConstant: 20),
            leftInfoStackView.trailingAnchor.constraint(equalTo: centralInfoStackView.leadingAnchor, constant: -3),
            
            centralInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            centralInfoStackView.heightAnchor.constraint(equalToConstant: 300),
            //centralInfoStackView.leadingAnchor.constraint(equalTo: leftInfoStackView.trailingAnchor, constant: 3),
            //centralInfoStackView.trailingAnchor.constraint(equalTo: rightInfoStackView.leadingAnchor, constant: -3),
            centralInfoStackView.widthAnchor.constraint(equalToConstant: 100),
            centralInfoStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            
            rightInfoStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rightInfoStackView.heightAnchor.constraint(equalToConstant: 300),
            rightInfoStackView.leadingAnchor.constraint(equalTo: centralInfoStackView.trailingAnchor, constant: 3),
            rightInfoStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -3),
            //rightInfoStackView.widthAnchor.constraint(equalToConstant: 20),

        ])
    }
}
