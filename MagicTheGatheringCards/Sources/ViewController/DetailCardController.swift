//
//  DetailCardController.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 29.06.2022.
//

import UIKit

final class DetailCardController: UIViewController {
    
    //MARK: - Variables
    
    var data: Displayable?
    
    //MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: view.frame.width, height: view.frame.height * Sizes.scrollHeightContentSize)
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    //Parameter headers
    private lazy var cardName = creatingLabel(withSize: Sizes.cardNameFontSize, weight: .bold, alignment: .center)
    private lazy var cardManaCostHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardTypeHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardRariryHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardSetNameHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardSetHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardLayoutHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardTextHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardArtistHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardPowerHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardToughnessHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    private lazy var cardFlavorHeader = creatingLabel(withSize: Sizes.fontSize0_05, weight: .bold)
    
    //Parameters
    private lazy var cardManaCost = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardType = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardRarity = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardSetName = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardSet = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardLayout = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardText = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardArtist = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardPower = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardToughness = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    private lazy var cardFlavor = creatingLabel(withSize: Sizes.fontSize0_04, weight: .semibold)
    
    //Stacks
    private lazy var manaCostStackView = creatingStackView()
    private lazy var typeStackView = creatingStackView()
    private lazy var rarityStackView = creatingStackView()
    private lazy var setNameStackView = creatingStackView()
    private lazy var setStackView = creatingStackView()
    private lazy var layoutStackView = creatingStackView()
    private lazy var textStackView = creatingStackView()
    private lazy var artistStackView = creatingStackView()
    private lazy var powerStackView = creatingStackView()
    private lazy var toughnessStackView = creatingStackView()
    private lazy var flavorStackView = creatingStackView()
        
    //MARK: - Initial
    
    init(data: Displayable?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.fatalErrorMessage)
    }
    
    private func commonInit() {
        guard let data = data else { return }
        
        cardName.text = data.nameTitle
        cardManaCostHeader.text = data.manaCostTitle.label
        cardTypeHeader.text = data.typeTitle.label
        cardRariryHeader.text = data.rariryTitle.label
        cardSetNameHeader.text = data.setNameTitle.label
        cardSetHeader.text = data.setTitle.label
        cardLayoutHeader.text = data.layoutTitle.label
        cardTextHeader.text = data.textTitle.label
        cardArtistHeader.text = data.artistTitle.label
        cardPowerHeader.text = data.powerTitle.label
        cardToughnessHeader.text = data.toughnessTitle.label
        cardFlavorHeader.text = data.flavorTitle.label
        
        cardManaCost.text = data.manaCostTitle.value
        cardType.text = data.typeTitle.value
        cardRarity.text = data.rariryTitle.value
        cardSetName.text = data.setNameTitle.value
        cardSet.text = data.setTitle.value
        cardLayout.text = data.layoutTitle.value
        cardText.text = data.textTitle.value
        cardArtist.text = data.artistTitle.value
        cardPower.text = data.powerTitle.value
        cardToughness.text = data.toughnessTitle.value
        cardFlavor.text = data.flavorTitle.value
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(cardName)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        manaCostStackView.addArrangedSubview(cardManaCostHeader)
        manaCostStackView.addArrangedSubview(cardManaCost)
        typeStackView.addArrangedSubview(cardTypeHeader)
        typeStackView.addArrangedSubview(cardType)
        rarityStackView.addArrangedSubview(cardRariryHeader)
        rarityStackView.addArrangedSubview(cardRarity)
        setNameStackView.addArrangedSubview(cardSetNameHeader)
        setNameStackView.addArrangedSubview(cardSetName)
        setStackView.addArrangedSubview(cardSetHeader)
        setStackView.addArrangedSubview(cardSet)
        layoutStackView.addArrangedSubview(cardLayoutHeader)
        layoutStackView.addArrangedSubview(cardLayout)
        textStackView.addArrangedSubview(cardTextHeader)
        textStackView.addArrangedSubview(cardText)
        artistStackView.addArrangedSubview(cardArtistHeader)
        artistStackView.addArrangedSubview(cardArtist)
        powerStackView.addArrangedSubview(cardPowerHeader)
        powerStackView.addArrangedSubview(cardPower)
        toughnessStackView.addArrangedSubview(cardToughnessHeader)
        toughnessStackView.addArrangedSubview(cardToughness)
        flavorStackView.addArrangedSubview(cardFlavorHeader)
        flavorStackView.addArrangedSubview(cardFlavor)
        
        stackView.addArrangedSubview(manaCostStackView)
        stackView.addArrangedSubview(typeStackView)
        stackView.addArrangedSubview(rarityStackView)
        stackView.addArrangedSubview(setNameStackView)
        stackView.addArrangedSubview(setStackView)
        stackView.addArrangedSubview(layoutStackView)
        stackView.addArrangedSubview(textStackView)
        stackView.addArrangedSubview(artistStackView)
        stackView.addArrangedSubview(powerStackView)
        stackView.addArrangedSubview(toughnessStackView)
        stackView.addArrangedSubview(flavorStackView)
    }
    
    private func setupLayout() {
        
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                      constant: adaptationToSpecificScreenSize(withSpecificValue: Offsets.cardNameSpecificTopOffset,
                                                                               andNormalValue: Offsets.cardNameNormalTopOffset)).isActive = true
        cardName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Offsets.leftOffset15).isActive = true
        cardName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Sizes.multiplierWidthSize0_92).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,
                                        constant: adaptationToSpecificScreenSize(withSpecificValue: Offsets.scrollViewSpecificTopOffset,
                                                                                 andNormalValue: Offsets.scrollViewNormalTopOffset)).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: Offsets.leftOffset15).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: Sizes.multiplierWidthSize0_92).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = Colors.indigoColor
    }
    
    //MARK: - Functions
    
    private func creatingLabel(withSize: CGFloat, weight: UIFont.Weight, alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: view.frame.width * withSize, weight: weight)
        label.shadowColor = .gray
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }
    
    private func creatingStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Offsets.stackViewSpacing
        return stackView
    }
    
    private func adaptationToSpecificScreenSize(withSpecificValue: CGFloat, andNormalValue: CGFloat) -> CGFloat {
        let device = UIDevice()
        if device.name == Strings.iPodName ||
            device.name == Strings.iPhoneSEName ||
            device.name == Strings.iPhone8Name ||
            device.name == Strings.iPhone8PlusName {
            return withSpecificValue
        } else {
            return andNormalValue
        }
    }
}
