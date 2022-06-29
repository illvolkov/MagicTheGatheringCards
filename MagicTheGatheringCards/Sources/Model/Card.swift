//
//  Card.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import Foundation

struct Card: Decodable {
    let name: String
    let manaCost: String?
    let type: String
    let rarity: String
    let setName: String
    let text: String?
    let artist: String?
    let power: String?
    let toughness: String?
    let flavor: String?
}
