//
//  Displayble.swift
//  MagicTheGatheringCards
//
//  Created by Ilya Volkov on 29.06.2022.
//

protocol Displayable {
    var nameTitle: String { get }
    var manaCostTitle: (label: String, value: String) { get }
    var typeTitle: (label: String, value: String) { get }
    var rariryTitle: (label: String, value: String) { get }
    var setNameTitle: (label: String, value: String) { get }
    var setTitle: (label: String, value: String) { get }
    var layoutTitle: (label: String, value: String) { get }
    var textTitle: (label: String, value: String) { get }
    var artistTitle: (label: String, value: String) { get }
    var powerTitle: (label: String, value: String) { get }
    var toughnessTitle: (label: String, value: String) { get }
    var flavorTitle: (label: String, value: String) { get }
}
