//
//  MoveModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

// MARK: - MoveDetails Model
struct MoveDetails: Codable {
    let accuracy: Int?
    let contestCombos: ContestCombos?
    let contestEffect: ContestEffect?
    let contestType, damageClass: URLObject?
    let effectChance: Int?
    let effectChanges: [JSONAny]
    let effectEntries: [EffectEntry]?
    let flavorTextEntries: [FlavorTextEntry]
    let generation: URLObject
    let id: Int
    let learnedByPokemon: [URLObject]
    let machines: [JSONAny]
    let meta: Meta?
    let name: String
    let names: [Name]
    let pastValues: [JSONAny]
    let power, pp, priority: Int?
    let statChanges: [JSONAny]
    let superContestEffect: ContestEffect?
    let target, type: URLObject

    enum CodingKeys: String, CodingKey {
        case accuracy
        case contestCombos = "contest_combos"
        case contestEffect = "contest_effect"
        case contestType = "contest_type"
        case damageClass = "damage_class"
        case effectChance = "effect_chance"
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case flavorTextEntries = "flavor_text_entries"
        case generation, id
        case learnedByPokemon = "learned_by_pokemon"
        case machines, meta, name, names
        case pastValues = "past_values"
        case power, pp, priority
        case statChanges = "stat_changes"
        case superContestEffect = "super_contest_effect"
        case target, type
    }
}

// MARK: - ContestCombos Model
struct ContestCombos: Codable {
    let normal, contestCombosSuper: Normal?

    enum CodingKeys: String, CodingKey {
        case normal
        case contestCombosSuper = "super"
    }
}

// MARK: - Normal Model
struct Normal: Codable {
    let useAfter: [URLObject]?
    let useBefore: [URLObject]?

    enum CodingKeys: String, CodingKey {
        case useAfter = "use_after"
        case useBefore = "use_before"
    }
}

// MARK: - ContestEffect Model
struct ContestEffect: Codable {
    let url: String
}

// MARK: - Meta Model
struct Meta: Codable {
    let ailment: URLObject?
    let ailmentChance: Int?
    let category: URLObject?
    let critRate, drain, flinchChance, healing: Int?
    let maxHits, maxTurns, minHits, minTurns: Int?
    let statChance: Int?

    enum CodingKeys: String, CodingKey {
        case ailment
        case ailmentChance = "ailment_chance"
        case category
        case critRate = "crit_rate"
        case drain
        case flinchChance = "flinch_chance"
        case healing
        case maxHits = "max_hits"
        case maxTurns = "max_turns"
        case minHits = "min_hits"
        case minTurns = "min_turns"
        case statChance = "stat_chance"
    }
}
