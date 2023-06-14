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
    let cardImageStackView           = UIStackView()
    
    let cardImageView: UIImageView = {
        let cardView = UIImageView()
        let cardImage = UIImage(named: "GTX-780 BoardFront")
        cardView.image = cardImage
        cardView.contentMode = .scaleToFill
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 7
        cardView.clipsToBounds = true
        return cardView
    }()
    
    let frontBoardView: UIImageView = {
        let cardView = UIImageView()
        let cardImage = UIImage(named: "GTX-")
        cardView.image = cardImage
        cardView.contentMode = .scaleToFill
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 7
        cardView.clipsToBounds = true
        return cardView
    }()
    
    let backBoardImageView: UIImageView = {
        let cardImageView = UIImageView()
        let cardImage = UIImage(named: "GTX-780 BoardBack")
        cardImageView.image = cardImage
        cardImageView.contentMode = .scaleToFill
        return cardImageView
    }()
    
    let crystalImageView: UIImageView = {
        let cardView = UIImageView()
        let cardImage = UIImage(named: "GTX-780 Crystal")
        cardView.image = cardImage
        cardView.contentMode = .scaleToFill
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 7
        cardView.clipsToBounds = true
        return cardView
    }()

    let cardImageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.contentSize = CGSize(width: 642, height: 0)
        return scrollView
    }()
    
    let specScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize(width: 0, height: 590)
        return scrollView
    }()
    
    let idLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
    
    let vendorLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 5
        label.rightInset = 5
        label.topInset = 2
        label.bottomInset = 3
        label.numberOfLines = 2
        label.clipsToBounds = true
        return label
    }()
    
    let tmusLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.layer.cornerRadius = 7
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .systemGray
        label.leftInset = 3
        label.rightInset = 3
        label.topInset = 3
        label.bottomInset = 3
        label.clipsToBounds = true
        return label
    }()
    
    let busLabel: UILabel = {
        let label = PaddingLabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 15, weight: .regular)
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
        label.font = .systemFont(ofSize: 14, weight: .regular)
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
    
    let closeButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        return button
    }()
    
//MARK: -closures
    var closeButtonPressedClosure: (()-> Void)?
    
//MARK: - init
    init() {
        super.init(frame: .zero)
        setupStackViews()
        addSubview(closeButton)
        addSubview(specScrollView)
        addSubview(cardImageScrollView)
        setupConstraints()
        cardImageScrollView.addSubview(cardImageView)
        cardImageScrollView.addSubview(crystalImageView)
        cardImagesSetupConstraints()
        //Targets for buttons
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    
    func cardImagesSetupConstraints() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        crystalImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            crystalImageView.topAnchor.constraint(equalTo: cardImageScrollView.topAnchor),
            crystalImageView.leadingAnchor.constraint(equalTo: cardImageScrollView.leadingAnchor, constant: 20),
            crystalImageView.widthAnchor.constraint(equalToConstant: 190),
            crystalImageView.heightAnchor.constraint(equalToConstant: 190),
            
            cardImageView.topAnchor.constraint(equalTo: cardImageScrollView.topAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: crystalImageView.trailingAnchor, constant: 15),
            cardImageView.widthAnchor.constraint(equalToConstant: 385),
            cardImageView.heightAnchor.constraint(equalToConstant: 190),
        ])
    }
    
    func setupStackViews() {
        let stackViews: [UIStackView] = [infoStackViewSectorOne,
                                         infoStackViewSectorTwo]
        stackViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        //cardImageStackView CFG
        cardImageStackView.axis = .horizontal
        cardImageStackView.distribution = .fillProportionally
        cardImageStackView.alignment = .fill
        cardImageStackView.spacing = 5
        //stackView sector one CFG
        infoStackViewSectorOne.axis            = .vertical
        infoStackViewSectorOne.distribution    = .fillEqually
        infoStackViewSectorOne.alignment       = .fill
        infoStackViewSectorOne.spacing         = 5
        //stackView sector two CFG
        infoStackViewSectorTwo.axis            = .vertical
        infoStackViewSectorTwo.distribution    = .fillEqually
        infoStackViewSectorTwo.alignment       = .fill
        infoStackViewSectorTwo.spacing         = 5
        addItemsToStackView()
        specScrollView.addSubview(idLabel)
        specScrollView.addSubview(gpuNameLabel)
        specScrollView.addSubview(infoStackViewSectorOne)
        specScrollView.addSubview(infoStackViewSectorTwo)
    }
    
    private func setupConstraints() {
        specScrollView.translatesAutoresizingMaskIntoConstraints = false
        cardImageScrollView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        gpuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            closeButton.widthAnchor.constraint(equalToConstant: 100),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            
            cardImageScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            cardImageScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cardImageScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            cardImageScrollView.heightAnchor.constraint(equalToConstant: 210),
            
            specScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 300),
            specScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            specScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            specScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            idLabel.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: specScrollView.leadingAnchor, constant: 5),
            idLabel.trailingAnchor.constraint(equalTo: specScrollView.centerXAnchor, constant: -20),
            idLabel.heightAnchor.constraint(equalToConstant: 45),
            
            gpuNameLabel.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            gpuNameLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 5),
            gpuNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            gpuNameLabel.heightAnchor.constraint(equalToConstant: 45),
            
            infoStackViewSectorOne.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            infoStackViewSectorOne.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            infoStackViewSectorOne.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: -20),
            infoStackViewSectorOne.heightAnchor.constraint(equalToConstant: 400),
            
            infoStackViewSectorTwo.topAnchor.constraint(equalTo: gpuNameLabel.bottomAnchor, constant: 5),
            infoStackViewSectorTwo.leadingAnchor.constraint(equalTo: infoStackViewSectorOne.trailingAnchor, constant: 5),
            infoStackViewSectorTwo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            infoStackViewSectorTwo.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func addItemsToStackView() {
        let itemsForInfoStackViewSectorOne: [UIView] = [vendorLabel,
                                                        gpuCoresLabel,
                                                        tmusLabel,
                                                        ropsLabel,
                                                        lOneLabel,
                                                        lTwoLabel,
                                                        tdpLabel,
                                                        psuLabel,
                                                        baseClockLabel,
                                                        boostClockLabel]
        
        let itemsForInfoStackViewSectorTwo: [UIView] = [memClockLabel,
                                                        memSizeLabel,
                                                        memTypeLabel,
                                                        busLabel,
                                                        directXLabel,
                                                        openGLLabel,
                                                        openCLLabel,
                                                        vulcanLabel,
                                                        cudaLabel,
                                                        shaderLabel]
        
        itemsForInfoStackViewSectorOne.forEach { infoStackViewSectorOne.addArrangedSubview($0) }
        itemsForInfoStackViewSectorTwo.forEach { infoStackViewSectorTwo.addArrangedSubview($0) }
    }
}
//MARK: -Extensions
extension DescriptionView {
    //Button handlers
    @objc func closeButtonPressed() {
        closeButtonPressedClosure?()
    }
    
}

extension UILabel {
    func labelTextAttributesChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: range)
        self.attributedText = attribute
    }
}
