//
//  ItemModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - ItemDetails Model
struct ItemDetails: Codable {
    let attributes: [URLObject]?
    let babyTriggerFor: EvolutionChain?
    let category: URLObject
    let cost: Int?
    let effectEntries: [EffectEntry]?
    let flavorTextEntries: [VersionGroupFlavorText]
    let flingPower: Int?
    let flingEffect: URLObject?
    let gameIndices: [GameIndex]
    let heldByPokemon: [ItemHolderPokemon]
    let id: Int?
    let machines: [MachineVersionDetail]?
    let name: String?
    let names: [Name]
    let sprites: ItemSprites?

    enum CodingKeys: String, CodingKey {
        case attributes
        case babyTriggerFor = "baby_trigger_for"
        case category, cost
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case flingEffect = "fling_effect"
        case flingPower = "fling_power"
        case gameIndices = "game_indices"
        case heldByPokemon = "held_by_pokemon"
        case id, machines, name, names, sprites
    }
}

// MARK: - ItemSprites Model
struct ItemSprites: Codable {
    let spritesDefault: String

    enum CodingKeys: String, CodingKey {
        case spritesDefault = "default"
    }
}

// MARK: - ItemHolderPokemon Model
struct ItemHolderPokemon: Codable {
    let pokemon: URLObject
    let versionDetails: [ItemHolderPokemonVersionDetail]

    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

// MARK: - ItemHolderPokemonVersionDetail Model
struct ItemHolderPokemonVersionDetail: Codable {
    let rarity: Int
    let version: Version

    enum CodingKeys: String, CodingKey {
        case rarity
        case version
    }
}

// MARK: - MachineVersionDetail Model
struct MachineVersionDetail: Codable {
    let machine: LinkOnly
    let versionGroup: URLObject?

    enum CodingKeys: String, CodingKey {
        case machine
        case versionGroup = "version_group"
    }
}
