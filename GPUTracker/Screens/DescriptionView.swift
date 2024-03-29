//
//  DescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 10.05.2023.
//

import UIKit

final class DescriptionView: UIView {
    let infoStackViewSectorOne = UIStackView()
    let infoStackViewSectorTwo = UIStackView()
    let cardImageStackView = UIStackView()
    let idLabel = PaddingLabel()
    let gpuNameLabel = PaddingLabel()
    let vendorLabel = PaddingLabel()
    let gpuCoresLabel = PaddingLabel()
    let tmusLabel = PaddingLabel()
    let ropsLabel = PaddingLabel()
    let lOneLabel = PaddingLabel()
    let lTwoLabel = PaddingLabel()
    let baseClockLabel = PaddingLabel()
    let boostClockLabel = PaddingLabel()
    let memClockLabel = PaddingLabel()
    let memSizeLabel = PaddingLabel()
    let memTypeLabel = PaddingLabel()
    let busLabel = PaddingLabel()
    let tdpLabel = PaddingLabel()
    let psuLabel = PaddingLabel()
    let directXLabel = PaddingLabel()
    let openGLLabel = PaddingLabel()
    let openCLLabel = PaddingLabel()
    let vulcanLabel = PaddingLabel()
    let cudaLabel = PaddingLabel()
    let shaderLabel = PaddingLabel()
    let releaseDateLabel = PaddingLabel()
    let processSizeLabel = PaddingLabel()
    let architectureLabel = PaddingLabel()
    let fp32FloatLabel = PaddingLabel()
    let foundryLabel = PaddingLabel()
    let crystalSizeLabel = PaddingLabel()
    
    let cardImageView: UIImageView = {
        let cardView = UIImageView()
        let cardImage = UIImage()
        cardView.image = cardImage
        cardView.contentMode = .scaleToFill
        cardView.clipsToBounds = true
        return cardView
    }()
    
    let crystalImageView: UIImageView = {
        let cardView = UIImageView()
        let cardImage = UIImage()
        cardView.image = cardImage
        cardView.contentMode = .scaleToFill
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
    
    let closeButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .regular)
        return button
    }()
    
    //MARK: Closures
    var closeButtonPressedClosure: (()-> Void)?
    //MARK: init
    init() {
        super.init(frame: .zero)
        cardImageScrollView.backgroundColor = .white
        setupStackViews()
        [idLabel, gpuNameLabel].forEach { $0.numberOfLines = 2 }
        configurateLabels(
            labels: [idLabel,
                     gpuNameLabel,
                     gpuCoresLabel,
                     vendorLabel,
                     tmusLabel,
                     ropsLabel,
                     lOneLabel,
                     lTwoLabel,
                     baseClockLabel,
                     boostClockLabel,
                     memClockLabel,
                     memSizeLabel,
                     memTypeLabel,
                     busLabel,
                     tdpLabel,
                     psuLabel,
                     directXLabel,
                     openGLLabel,
                     openCLLabel,
                     vulcanLabel,
                     cudaLabel,
                     shaderLabel,
                     releaseDateLabel,
                     processSizeLabel,
                     architectureLabel,
                     fp32FloatLabel,
                     foundryLabel,
                     crystalSizeLabel
                    ]
        )
        
        [closeButton,
         specScrollView,
         cardImageScrollView
        ].forEach { addSubview($0) }
        
        setupConstraints()
        cardImageScrollView.addSubview(cardImageView)
        cardImageScrollView.addSubview(crystalImageView)
        cardImagesSetupConstraints()
        
        //MARK: Targets for buttons
        closeButton.addTarget(
            self,
            action: #selector(closeButtonPressed),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DescriptionView {
    final func cardImagesSetupConstraints() {
        [cardImageView, crystalImageView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate([
            crystalImageView.centerYAnchor.constraint(equalTo: cardImageScrollView.centerYAnchor),
            crystalImageView.leadingAnchor.constraint(equalTo: cardImageScrollView.leadingAnchor, constant: 20),
            crystalImageView.widthAnchor.constraint(equalToConstant: 190),
            crystalImageView.heightAnchor.constraint(equalToConstant: 190),
            
            cardImageView.centerYAnchor.constraint(equalTo: cardImageScrollView.centerYAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: crystalImageView.trailingAnchor, constant: 15),
            cardImageView.widthAnchor.constraint(equalToConstant: 385),
            cardImageView.heightAnchor.constraint(equalToConstant: 190)])
    }
    
    final func setupStackViews() {
        let stackViews: [UIStackView] = [
            infoStackViewSectorOne,
            infoStackViewSectorTwo
        ]
        stackViews.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        //MARK: cardImageStackView CFG
        configurateHorizontalStackView(cardImageStackView)
        //MARK: stackView sectors CFG
        configurateVerticalStackView(infoStackViewSectorOne)
        configurateVerticalStackView(infoStackViewSectorTwo)
        addItemsToStackView()
        [idLabel,
         gpuNameLabel,
         infoStackViewSectorOne,
         infoStackViewSectorTwo
        ].forEach { specScrollView.addSubview($0) }
    }
    
    final private func setupConstraints() {
        [specScrollView,
         cardImageScrollView,
         closeButton,
         idLabel,
         gpuNameLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 15
            ),
            closeButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            closeButton.widthAnchor.constraint(equalToConstant: 100),
            closeButton.heightAnchor.constraint(equalToConstant: 35),
            
            cardImageScrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 59
            ),
            cardImageScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            cardImageScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            cardImageScrollView.heightAnchor.constraint(equalToConstant: 250),
            
            specScrollView.topAnchor.constraint(
                equalTo: cardImageScrollView.bottomAnchor,
                constant: 15
            ),
            specScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            specScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            specScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            idLabel.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: infoStackViewSectorOne.leadingAnchor),
            idLabel.trailingAnchor.constraint(
                equalTo: specScrollView.centerXAnchor,
                constant: -20
            ),
            idLabel.heightAnchor.constraint(equalToConstant: 45),
            
            gpuNameLabel.topAnchor.constraint(equalTo: specScrollView.topAnchor),
            gpuNameLabel.leadingAnchor.constraint(
                equalTo: idLabel.trailingAnchor,
                constant: 5
            ),
            gpuNameLabel.trailingAnchor.constraint(equalTo: infoStackViewSectorTwo.trailingAnchor),
            gpuNameLabel.heightAnchor.constraint(equalToConstant: 45),
            
            infoStackViewSectorOne.topAnchor.constraint(
                equalTo: idLabel.bottomAnchor,
                constant: 5
            ),
            infoStackViewSectorOne.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            infoStackViewSectorOne.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerXAnchor,
                constant: -20
            ),
            infoStackViewSectorOne.heightAnchor.constraint(equalToConstant: 500),
            
            infoStackViewSectorTwo.topAnchor.constraint(
                equalTo: gpuNameLabel.bottomAnchor,
                constant: 5
            ),
            infoStackViewSectorTwo.leadingAnchor.constraint(
                equalTo: infoStackViewSectorOne.trailingAnchor,
                constant: 5
            ),
            infoStackViewSectorTwo.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -10
            ),
            infoStackViewSectorTwo.heightAnchor.constraint(equalToConstant: 500),
        ])
    }
    
    final private func addItemsToStackView() {
        let itemsForInfoStackViewSectorOne: [UIView] = [
            vendorLabel,
            gpuCoresLabel,
            tmusLabel,
            ropsLabel,
            lOneLabel,
            lTwoLabel,
            tdpLabel,
            psuLabel,
            baseClockLabel,
            boostClockLabel,
            releaseDateLabel,
            processSizeLabel,
            architectureLabel
        ]
        
        let itemsForInfoStackViewSectorTwo: [UIView] = [
            memClockLabel,
            memSizeLabel,
            memTypeLabel,
            busLabel,
            directXLabel,
            openGLLabel,
            openCLLabel,
            vulcanLabel,
            cudaLabel,
            shaderLabel,
            fp32FloatLabel,
            foundryLabel,
            crystalSizeLabel
        ]
        
        itemsForInfoStackViewSectorOne.forEach { infoStackViewSectorOne.addArrangedSubview($0) }
        itemsForInfoStackViewSectorTwo.forEach { infoStackViewSectorTwo.addArrangedSubview($0) }
    }
}
//MARK: - DescriptionView extension
extension DescriptionView {
    //MARK: Button handlers
    @objc final func closeButtonPressed() {
        closeButtonPressedClosure?()
    }
    
    final func configurateLabels(labels: [PaddingLabel]) {
        labels.forEach { label in
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
        }
    }
    
    final func configurateVerticalStackView(_ stackView: UIStackView) {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
    }
    
    final func configurateHorizontalStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 5
    }
}
//MARK: - UILabel extension
extension UILabel {
    //MARK: custom text highlight
    final func labelTextAttributesChange(
        fullText : String ,
        changeText : String
    ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.black,
            range: range
        )
        attribute.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 15, weight: .medium),
            range: range
        )
        self.attributedText = attribute
    }
}
