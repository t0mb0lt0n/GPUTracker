//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

class DescriptionView: UIView {
    let infoStackViewSectorOne       = UIStackView()
    let infoStackViewSectorTwo       = UIStackView()
    let infoStackViewSectorThree     = UIStackView()
    let infoStackViewSectorFour      = UIStackView()
    
    let specScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize(width: 300, height: 1500)
        return scrollView
    }()
    
    let idLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.numberOfLines = 1
        //label.text.line
        label.clipsToBounds = true
        return label
    }()
    
    let vendorLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let gpuCoresLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let gpuNameLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let tmusLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let ropsLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let lOneLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let lTwoLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let baseClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let boostClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let memClockLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let memSizeLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
    
    let memTypeLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let busLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let tdpLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let psuLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let directXLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let openGLLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let openCLLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let vulcanLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let cudaLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let shaderLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let shaderLabel2: UILabel = {
        let label = PaddingLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
        setupStackViews()
        addSubview(specScrollView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    func setupStackViews() {
        let stackViews: [UIStackView] = [infoStackViewSectorOne,
                                         infoStackViewSectorTwo,
                                         infoStackViewSectorThree,
                                         infoStackViewSectorFour]
        stackViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subView)
        }
        
        //left stackView cfg
        infoStackViewSectorOne.axis            = .vertical
        infoStackViewSectorOne.distribution    = .fillEqually
        infoStackViewSectorOne.alignment       = .fill
        infoStackViewSectorOne.spacing         = 5
        //central stackView cfg
        infoStackViewSectorTwo.axis            = .vertical
        infoStackViewSectorTwo.distribution    = .fillEqually
        infoStackViewSectorTwo.alignment       = .fill
        infoStackViewSectorTwo.spacing         = 5
        //right stackView cfg
        infoStackViewSectorThree.axis            = .vertical
        infoStackViewSectorThree.distribution    = .fillEqually
        infoStackViewSectorThree.alignment       = .fill
        infoStackViewSectorThree.spacing         = 5
        
        infoStackViewSectorFour.axis            = .vertical
        infoStackViewSectorFour.distribution    = .fillEqually
        infoStackViewSectorFour.alignment       = .fill
        infoStackViewSectorFour.spacing         = 5
        addItemsToStackView()
        specScrollView.addSubview(infoStackViewSectorOne)
        specScrollView.addSubview(infoStackViewSectorTwo)
        specScrollView.addSubview(infoStackViewSectorThree)
        specScrollView.addSubview(infoStackViewSectorFour)

    }
    
    private func setupConstraints() {
        specScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            specScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            specScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            specScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            specScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            infoStackViewSectorOne.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            infoStackViewSectorOne.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            infoStackViewSectorOne.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -2),
            infoStackViewSectorOne.heightAnchor.constraint(equalToConstant: 300),
            
            infoStackViewSectorTwo.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            infoStackViewSectorTwo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 2),
            infoStackViewSectorTwo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            infoStackViewSectorTwo.heightAnchor.constraint(equalToConstant: 300),
            
            infoStackViewSectorThree.topAnchor.constraint(equalTo: infoStackViewSectorOne.bottomAnchor, constant: 3),
            infoStackViewSectorThree.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            infoStackViewSectorThree.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -2),
            infoStackViewSectorThree.heightAnchor.constraint(equalToConstant: 250),
            
            infoStackViewSectorFour.topAnchor.constraint(equalTo: infoStackViewSectorThree.topAnchor),
            infoStackViewSectorFour.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 2),
            infoStackViewSectorFour.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            infoStackViewSectorFour.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func addItemsToStackView() {
        let itemsForInfoStackViewSectorOne: [UIView] = [idLabel,
                                                        vendorLabel,
                                                        gpuCoresLabel,
                                                        gpuNameLabel,
                                                        tmusLabel,
                                                        ropsLabel,
                                                        lOneLabel]
        
        let itemsForInfoStackViewSectorTwo: [UIView] = [lTwoLabel,
                                                        baseClockLabel,
                                                        boostClockLabel,
                                                        memClockLabel,
                                                        memSizeLabel,
                                                        memTypeLabel,
                                                        busLabel]
        
        let itemsForInfoStackViewSectorThree: [UIView] = [tdpLabel,
                                                          psuLabel,
                                                          directXLabel,
                                                          openGLLabel]
                                                
        
        let itemsForInfoStackViewSectorFour: [UIView] = [openCLLabel,
                                                         vulcanLabel,
                                                         cudaLabel,
                                                         shaderLabel]
        
        for item in itemsForInfoStackViewSectorOne {
            infoStackViewSectorOne.addArrangedSubview(item)
        }
        
        for item in itemsForInfoStackViewSectorTwo {
            infoStackViewSectorTwo.addArrangedSubview(item)
        }
        
        for item in itemsForInfoStackViewSectorThree {
            infoStackViewSectorThree.addArrangedSubview(item)
        }
        
        for item in itemsForInfoStackViewSectorFour {
            infoStackViewSectorFour.addArrangedSubview(item)
        }
    }
}

extension UILabel {
    func labelTextAttributesChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: .regular), range: range)
        self.attributedText = attribute
    }
}
