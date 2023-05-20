//
//  LocationModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - LocationDetails
struct LocationDetails: Codable {
    let areas: [URLObject]
    let gameIndices: [GameIndex]
    let id: Int
    let name: String
    let names: [Name]
    let region: URLObject

    enum CodingKeys: String, CodingKey {
        case areas
        case gameIndices = "game_indices"
        case id, name, names, region
    }
}

// MARK: - LocationArea
struct LocationArea: Codable {
    let encounterMethodRates: [EncounterMethodRate]
    let gameIndex, id: Int
    let location: URLObject
    let name: String
    let names: [Name]
    let pokemonEncounters: [PokemonEncounter]

    enum CodingKeys: String, CodingKey {
        case encounterMethodRates = "encounter_method_rates"
        case gameIndex = "game_index"
        case id, location, name, names
        case pokemonEncounters = "pokemon_encounters"
    }
}

// MARK: - EncounterMethodRate
struct EncounterMethodRate: Codable {
    let encounterMethod: URLObject
    let versionDetails: [EncounterMethodRateVersionDetail]

    enum CodingKeys: String, CodingKey {
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }
}

// MARK: - EncounterMethodRateVersionDetail
struct EncounterMethodRateVersionDetail: Codable {
    let rate: Int
    let version: URLObject
}


// MARK: - PokemonEncounter
struct PokemonEncounter: Codable, Identifiable {
    let id  = UUID()
    let pokemon: URLObject
    let versionDetails: [PokemonEncounterVersionDetail]

    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}

// MARK: - PokemonEncounterVersionDetail
struct PokemonEncounterVersionDetail: Codable, Identifiable {
    let id = UUID()
    let encounterDetails: [EncounterDetail]
    let maxChance: Int
    let version: URLObject

    enum CodingKeys: String, CodingKey {
        case encounterDetails = "encounter_details"
        case maxChance = "max_chance"
        case version
    }
}

// MARK: - EncounterDetail
struct EncounterDetail: Codable {
    let chance: Int
    let conditionValues: [URLObject]
    let maxLevel: Int
    let method: URLObject
    let minLevel: Int

    enum CodingKeys: String, CodingKey {
        case chance
        case conditionValues = "condition_values"
        case maxLevel = "max_level"
        case method
        case minLevel = "min_level"
    }
}

// MARK: - PokemonLocationArea
struct PokemonLocationArea: Codable, Identifiable {
    let id = UUID()
    let locationArea: URLObject
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }
}



