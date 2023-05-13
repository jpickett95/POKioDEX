//
//  MoveModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

// MARK: - MoveDetails
struct MoveDetails: Codable {
    let accuracy: Int
    let contestCombos: ContestCombos
    let contestEffect: ContestEffect
    let contestType, damageClass: ContestType
    let effectChance: JSONNull?
    let effectChanges: [JSONAny]
    let effectEntries: [EffectEntry]
    let flavorTextEntries: [FlavorTextEntry]
    let generation: ContestType
    let id: Int
    let learnedByPokemon: [ContestType]
    let machines: [JSONAny]
    let meta: Meta
    let name: String
    let names: [Name]
    let pastValues: [JSONAny]
    let power, pp, priority: Int
    let statChanges: [JSONAny]
    let superContestEffect: ContestEffect
    let target, type: ContestType

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

// MARK: - ContestCombos
struct ContestCombos: Codable {
    let normal, contestCombosSuper: Normal

    enum CodingKeys: String, CodingKey {
        case normal
        case contestCombosSuper = "super"
    }
}

// MARK: - Normal
struct Normal: Codable {
    let useAfter: JSONNull?
    let useBefore: [ContestType]?

    enum CodingKeys: String, CodingKey {
        case useAfter = "use_after"
        case useBefore = "use_before"
    }
}

// MARK: - ContestType
struct ContestType: Codable {
    let name: String
    let url: String
}

// MARK: - ContestEffect
struct ContestEffect: Codable {
    let url: String
}



// MARK: - Meta
struct Meta: Codable {
    let ailment: ContestType
    let ailmentChance: Int
    let category: ContestType
    let critRate, drain, flinchChance, healing: Int
    let maxHits, maxTurns, minHits, minTurns: JSONNull?
    let statChance: Int

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
