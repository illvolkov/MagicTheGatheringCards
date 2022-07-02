//
//  CardsTableViewCell.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import Foundation
import UIKit

final class CardsTableViewCell: UITableViewCell {
    
    //MARK: - Cell identifier
    
    static let identifier = Strings.cardsIdentifier
    
    //MARK: - Views
    
    private lazy var cardName: UILabel = {
        let cardName = UILabel()
        cardName.font = .systemFont(ofSize: contentView.frame.width * Sizes.fontSize0_05, weight: .bold)
        cardName.textColor = .white
        cardName.shadowColor = .gray
        return cardName
    }()
    
    private lazy var cardSetName: UILabel = {
        let cardSetName = UILabel()
        cardSetName.font = .systemFont(ofSize: contentView.frame.width * Sizes.fontSize0_04, weight: .semibold)
        cardSetName.textColor = .white
        cardSetName.shadowColor = .gray
        return cardSetName
    }()
    
    //MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Settings
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: Offsets.contentViewTopOffset, left: 0, bottom: 0, right: 0))
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cardName)
        contentView.addSubview(cardSetName)
    }
    
    private func setupLayout() {
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Offsets.topLeftBottomOffset10).isActive = true
        cardName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.topLeftBottomOffset10).isActive = true
        cardName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.multiplierWidthSize0_9).isActive = true
        
        cardSetName.translatesAutoresizingMaskIntoConstraints = false
        cardSetName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offsets.topLeftBottomOffset10).isActive = true
        cardSetName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Offsets.topLeftBottomOffset10).isActive = true
        cardSetName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: Sizes.multiplierWidthSize0_9).isActive = true
    }
    
    private func setupContentView() {
        contentView.heightAnchor.constraint(equalToConstant: contentView.frame.width * Sizes.contenViewMultiplierHeightSize).isActive = true
        contentView.backgroundColor = Colors.indigoColor
        contentView.layer.cornerRadius = contentView.frame.width * Sizes.contentViewMultiplierCornerRadius
    }
    
    func configure(with model: Displayable) {
        cardName.text = model.nameTitle
        cardSetName.text = "\(Strings.fromSet) \(model.setNameTitle.value)"
    }
}
