//
//  Constants.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 01.07.2022.
//

import UIKit

enum Offsets {
    static let leftOffset15: CGFloat = 15
    static let cardNameSpecificTopOffset: CGFloat = 50
    static let cardNameNormalTopOffset: CGFloat = 100
    static let scrollViewSpecificTopOffset: CGFloat = 150
    static let scrollViewNormalTopOffset: CGFloat = 250
    static let stackViewSpacing: CGFloat = 3
    static let contentViewTopOffset: CGFloat = 15
    static let topLeftBottomOffset10: CGFloat = 10
}

enum Sizes {
    static let scrollHeightContentSize: CGFloat = 1.25
    static let cardNameFontSize: CGFloat = 0.08
    static let fontSize0_05: CGFloat = 0.05
    static let fontSize0_04: CGFloat = 0.04
    static let multiplierWidthSize0_92: CGFloat = 0.92
    static let multiplierWidthSize0_9: CGFloat = 0.9
    static let contenViewMultiplierHeightSize: CGFloat = 0.25
    static let contentViewMultiplierCornerRadius: CGFloat = 0.05
}

enum Strings {
    static let viewTitle: String = "MTG Cards"
    static let mtgCardsPath: String = "https://api.magicthegathering.io/v1/cards"
    static let parameterRandomName: String = "random"
    static let parameterRandomValue: String = "true"
    static let iPodName: String = "iPod touch (7th generation)"
    static let iPhoneSEName: String = "iPhone SE (3rd generation)"
    static let iPhone8Name: String = "iPhone 8"
    static let iPhone8PlusName: String = "iPhone 8 Plus"
    static let cardsIdentifier: String = "CardsTableViewCell"
    static let fromSet: String = "From set"
}

enum Colors {
    static let indigoColor: UIColor = UIColor(rgb: 0x4B0082)
}
