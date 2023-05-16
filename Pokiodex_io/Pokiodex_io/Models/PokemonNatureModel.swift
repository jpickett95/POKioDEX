//
//  PokemonNatureModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

// MARK: - PokemonNature
struct PokemonNature: Codable {
    let decreasedStat, hatesFlavor: JSONNull?
    let id: Int
    let increasedStat, likesFlavor: JSONNull?
    let moveBattleStylePreferences: [MoveBattleStylePreference]
    let name: String
    let names: [Name]
    let pokeathlonStatChanges: [PokeathlonStatChange]

    enum CodingKeys: String, CodingKey {
        case decreasedStat = "decreased_stat"
        case hatesFlavor = "hates_flavor"
        case id
        case increasedStat = "increased_stat"
        case likesFlavor = "likes_flavor"
        case moveBattleStylePreferences = "move_battle_style_preferences"
        case name, names
        case pokeathlonStatChanges = "pokeathlon_stat_changes"
    }
}

// MARK: - MoveBattleStylePreference
struct MoveBattleStylePreference: Codable {
    let highHPPreference, lowHPPreference: Int
    let moveBattleStyle: URLObject

    enum CodingKeys: String, CodingKey {
        case highHPPreference = "high_hp_preference"
        case lowHPPreference = "low_hp_preference"
        case moveBattleStyle = "move_battle_style"
    }
}

// MARK: - PokeathlonStatChange
struct PokeathlonStatChange: Codable {
    let maxChange: Int
    let pokeathlonStat: URLObject

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case pokeathlonStat = "pokeathlon_stat"
    }
}
