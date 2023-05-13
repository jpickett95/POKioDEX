//
//  ItemModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - ItemDetails
struct ItemDetails: Codable {
    let attributes: [URLObject]
    let babyTriggerFor: JSONNull?
    let category: URLObject
    let cost: Int
    let effectEntries: [EffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
    let flingEffect, flingPower: JSONNull?
    let gameIndices: [GameIndex]
    let heldByPokemon: [JSONAny]
    let id: Int
    let machines: [JSONAny]
    let name: String
    let names: [Name]
    let sprites: ItemSprites

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

// MARK: - Sprites
struct ItemSprites: Codable {
    let spritesDefault: String

    enum CodingKeys: String, CodingKey {
        case spritesDefault = "default"
    }
}
