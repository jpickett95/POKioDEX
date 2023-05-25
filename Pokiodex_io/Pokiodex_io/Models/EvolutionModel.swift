//
//  EvolutionModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - EvolutionChain Model
struct EvolutionChain: Codable {
    let babyTriggerItem: JSONAny?
    let chain: Chain
    let id: Int

    enum CodingKeys: String, CodingKey {
        case babyTriggerItem = "baby_trigger_item"
        case chain, id
    }
}

// MARK: - Chain Model
struct Chain: Codable, Identifiable {
    let id = UUID()
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [Chain]
    let isBaby: Bool
    let species: URLObject

    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - EvolutionDetail Model
struct EvolutionDetail: Codable {
    let gender, heldItem, item, knownMove: JSONAny?
    let knownMoveType, location, minAffection, minBeauty: JSONAny?
    let minHappiness: JSONAny?
    let minLevel: Int?
    let needsOverworldRain: Bool?
    let partySpecies, partyType, relativePhysicalStats: JSONAny?
    let timeOfDay: String?
    let tradeSpecies: JSONAny?
    let trigger: URLObject
    let turnUpsideDown: Bool?

    enum CodingKeys: String, CodingKey {
        case gender
        case heldItem = "held_item"
        case item
        case knownMove = "known_move"
        case knownMoveType = "known_move_type"
        case location
        case minAffection = "min_affection"
        case minBeauty = "min_beauty"
        case minHappiness = "min_happiness"
        case minLevel = "min_level"
        case needsOverworldRain = "needs_overworld_rain"
        case partySpecies = "party_species"
        case partyType = "party_type"
        case relativePhysicalStats = "relative_physical_stats"
        case timeOfDay = "time_of_day"
        case tradeSpecies = "trade_species"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}


// MARK: - EvolutionTrigger Model
struct EvolutionTrigger: Codable {
    let id: Int
    let name: String
    let names: [Name]
    let pokemonSpecies: [URLObject]

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}

