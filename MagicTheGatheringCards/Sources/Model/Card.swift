//
//  Card.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 28.06.2022.
//

import Foundation

struct Card: Decodable, Displayable {
    
    let name: String
    let manaCost: String?
    let type: String
    let rarity: String
    let setName: String
    let set: String
    let layout: String
    let text: String?
    let artist: String?
    let power: String?
    let toughness: String?
    let flavor: String?
    
    private func check(_ parameter: String?) -> String {
        guard let parameter = parameter else {
            return "This card does not have this option"
        }
        return parameter
    }
        
    var nameTitle: String {
        check(name)
    }
    
    var manaCostTitle: (label: String, value: String) {
        (label: "MANA COST", value: check(manaCost))
    }
    
    var typeTitle: (label: String, value: String) {
        (label: "TYPE", value: check(type))
    }
         
    var rariryTitle: (label: String, value: String) {
        (label: "RARITY", value: check(rarity))
    }
             
    var setNameTitle: (label: String, value: String) {
        (label: "SET NAME", value: check(setName))
    }
    
    var setTitle: (label: String, value: String) {
        (label: "SET", value: set)
    }
    
    var layoutTitle: (label: String, value: String) {
        (label: "LAYOUT", value: layout)
    }
    
    var textTitle: (label: String, value: String) {
        (label: "TEXT", value: check(text))
    }
    
    var artistTitle: (label: String, value: String) {
        (label: "ARTIST", value: check(artist))
    }
    
    var powerTitle: (label: String, value: String) {
        (label: "POWER", value: check(power))
    }
    
    var toughnessTitle: (label: String, value: String) {
        (label: "TOUGHNESS", value: check(toughness))
    }
    
    var flavorTitle: (label: String, value: String) {
        (label: "FLAVOR", value: check(flavor))
    }
}
