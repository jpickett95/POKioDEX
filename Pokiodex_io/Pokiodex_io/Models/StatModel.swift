//
//  StatModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/12/23.
//

import Foundation

// MARK: - PokemonStat Model
struct PokemonStat: Codable {
    let affectingMoves, affectingNatures: Affecting
    let characteristics: [CharacteristicLink]
    let gameIndex, id: Int
    let isBattleOnly: Bool
    let moveDamageClass: JSONNull?
    let name: String
    let names: [Name]

    enum CodingKeys: String, CodingKey {
        case affectingMoves = "affecting_moves"
        case affectingNatures = "affecting_natures"
        case characteristics
        case gameIndex = "game_index"
        case id
        case isBattleOnly = "is_battle_only"
        case moveDamageClass = "move_damage_class"
        case name, names
    }
}

// MARK: - Affecting Model
struct Affecting: Codable {
    let decrease, increase: [JSONAny]
}

// MARK: - CharacteristicLink Model
struct CharacteristicLink: Codable {
    let url: String
}
