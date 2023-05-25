//
//  AbilityModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - AbilityDetails Model
struct AbilityDetails: Codable {
    let effectChanges: [EffectChange]
    let effectEntries: [AbilityDetailsEffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
    let generation: URLObject
    let id: Int
    let isMainSeries: Bool
    let name: String
    let names: [Name]
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case isMainSeries = "is_main_series"
        case name, names, pokemon
    }
}

// MARK: - EffectChange Model
struct EffectChange: Codable {
    let effectEntries: [EffectChangeEffectEntry]
    let versionGroup: URLObject

    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case versionGroup = "version_group"
    }
}

// MARK: - EffectChangeEffectEntry Model
struct EffectChangeEffectEntry: Codable {
    let effect: String
    let language: URLObject
}



// MARK: - AbilityDetailsEffectEntry Model
struct AbilityDetailsEffectEntry: Codable {
    let effect: String
    let language: URLObject
    let shortEffect: String

    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}

