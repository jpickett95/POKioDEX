//
//  CommonModels.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - ResourceList Model
struct ResourceList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Result]
}

// MARK: - Result Model
struct Result: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var sample = Result(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

// MARK: - GenerationI Model
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
}

// MARK: - GenerationII Model
struct GenerationII: Codable {
    let crystal: Crystal
    let gold, silver: Gold
}

// MARK: - GenerationIII Model
struct GenerationIII: Codable {
    let emerald: OfficialArtwork
    let fireredLeafgreen, rubySapphire: Gold

    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - GenerationIV Model
struct GenerationIV: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
}

// MARK: - GenerationV Model
struct GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationVII Model
struct GenerationVII: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - GenerationVIII Model
struct GenerationVIII: Codable {
    let icons: DreamWorld
}

// MARK: - VersionGroupDetail Model
struct VersionGroupDetail: Codable, Identifiable {
    let id = UUID()
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: URLObject

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - Versions Model
struct Versions: Codable {
    let generationI: GenerationI
    let generationII: GenerationII
    let generationIII: GenerationIII
    let generationIV: GenerationIV
    let generationV: GenerationV
    let generationVI: [String: Home]
    let generationVII: GenerationVII
    let generationVIII: GenerationVIII

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationII = "generation-ii"
        case generationIII = "generation-iii"
        case generationIV = "generation-iv"
        case generationV = "generation-v"
        case generationVI = "generation-vi"
        case generationVII = "generation-vii"
        case generationVIII = "generation-viii"
    }
}

// MARK: - FlavorTextEntry Model
struct FlavorTextEntry: Codable, Identifiable {
    let id = UUID()
    let flavorText: String?
    let language, versionGroup: URLObject?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
        case versionGroup = "version_group"
    }
}

// MARK: - Name Model
struct Name: Codable {
    let language: URLObject
    let name: String
}

// MARK: - Pokemon Model
struct Pokemon: Codable, Identifiable {
    let id = UUID()
    let isHidden: Bool?
    let pokemon: URLObject
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case pokemon, slot
    }
}

// MARK: - URLObject Model
struct URLObject: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

// MARK: - LinkOnly Model
struct LinkOnly: Codable {
    let url: String
}

// MARK: - GameIndex Model
struct GameIndex: Codable {
    let gameIndex: Int
    let generation: URLObject?
    let version: URLObject?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case generation
        case version
    }
}

// MARK: - Language Model
struct Language: Codable {
    let id: Int?
    let iso3166, iso639, name: String?
    let names: [Name]?
    let official: Bool?
}

// MARK: - EffectEntry Model
struct EffectEntry: Codable {
    let effect: String
    let language: URLObject
    let shortEffect: String

    enum CodingKeys: String, CodingKey {
        case effect, language
        case shortEffect = "short_effect"
    }
}

// MARK: - VersionDetail Model
struct VersionDetail: Codable, Identifiable {
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

// MARK: - Version Model
struct Version: Codable {
    let id: Int?
    let name: String
    let names: [Name]?
    let versionGroup: URLObject?

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case versionGroup = "version_group"
    }
}

// MARK: - VersionGroup Model
struct VersionGroup: Codable {
    let generation: URLObject?
    let id: Int?
    let moveLearnMethods: [URLObject]?
    let name: String?
    let order: Int?
    let pokedexes, regions, versions: [URLObject]?

    enum CodingKeys: String, CodingKey {
        case generation, id
        case moveLearnMethods = "move_learn_methods"
        case name, order, pokedexes, regions, versions
    }
}

// MARK: - VersionGroupFlavorText Model
struct VersionGroupFlavorText: Codable {
    let text: String
    let language: Language
    let versionGroup: VersionGroup

    enum CodingKeys: String, CodingKey {
        case text, language
        case versionGroup = "version_group"
      
    }
}
