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
    
    private lazy var cardName: UILabel = {
        let cardName = UILabel()
        cardName.font = .systemFont(ofSize: contentView.frame.width * 0.05, weight: .bold)
        cardName.textColor = .white
        cardName.shadowColor = .gray
        return cardName
    }()
    
    private lazy var cardSetName: UILabel = {
        let cardSetName = UILabel()
        cardSetName.font = .systemFont(ofSize: contentView.frame.width * 0.04, weight: .semibold)
        cardSetName.textColor = .white
        cardSetName.shadowColor = .gray
        return cardSetName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cardName)
        contentView.addSubview(cardSetName)
    }
    
    private func setupLayout() {
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cardName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        cardName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        cardSetName.translatesAutoresizingMaskIntoConstraints = false
        cardSetName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        cardSetName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        cardSetName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    private func setupContentView() {
        contentView.heightAnchor.constraint(equalToConstant: contentView.frame.width * 0.25).isActive = true
        contentView.backgroundColor = UIColor(rgb: 0x9966CC)
        contentView.layer.cornerRadius = contentView.frame.width * 0.05
    }
    
    func configure(with model: Card) {
        cardName.text = model.name
        cardSetName.text = "From set \(model.setName)"
    }
}
