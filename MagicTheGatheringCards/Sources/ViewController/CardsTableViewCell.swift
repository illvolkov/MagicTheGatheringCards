//
//  CardsTableViewCell.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import Foundation
import UIKit

class CardsTableViewCell: UITableViewCell {
    static let identifier = "CardsTableViewCell"
    
    private lazy var cardImage: UIImageView = {
        let cardImage = UIImageView()
        return cardImage
    }()
    
    private lazy var cardName: UILabel = {
        let cardName = UILabel()
        cardName.font = .systemFont(ofSize: contentView.frame.width * 0.05, weight: .semibold)
        return cardName
    }()
    
    private lazy var cardSetName: UILabel = {
        let cardSetName = UILabel()
        cardSetName.font = .systemFont(ofSize: contentView.frame.width * 0.05)
        return cardSetName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cardImage)
        contentView.addSubview(cardName)
        contentView.addSubview(cardSetName)
    }
    
    private func setupLayout() {
        //TODO: - Adjusting UI elements
    }
    
    func configure(with model: Card?) {
        cardName.text = model?.name
        cardSetName.text = model?.setName
        
        guard let imagePath = model?.imageUrl,
              let imageUrl = URL(string: imagePath),
              let imageData = try? Data(contentsOf: imageUrl)
        else {
            cardImage.image = UIImage(systemName: "error")
            return
        }
        cardImage.image = UIImage(data: imageData)
    }
}
