//
//  PokemonModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import Foundation

// MARK: - PokemonDetails Model
struct PokemonDetails: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [URLObject]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [JSONAny]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let pastTypes: [JSONAny]
    let species: URLObject
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
}

// MARK: - Ability Model
struct Ability: Codable, Identifiable {
    let id = UUID()
    let ability: URLObject
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Move Model
struct Move: Codable, Identifiable {
    let id = UUID()
    let move: URLObject
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - Sprites Model
class Sprites: Codable {
    let backDefault: String
    let backFemale: String?
    let backShiny: String
    let backShinyFemale: String?
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String
    let frontShinyFemale: String?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }

    init(backDefault: String, backFemale: String?, backShiny: String, backShinyFemale: String?, frontDefault: String, frontFemale: String?, frontShiny: String, frontShinyFemale: String?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - RedBlue Model
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String
    let frontGray, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Crystal Model
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold Model
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String
    let frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - OfficialArtwork Model
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
    
    static var sample = OfficialArtwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png")
}

// MARK: - Home Model
struct Home: Codable {
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String
    let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - DreamWorld Model
struct DreamWorld: Codable {
    let frontDefault: String
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - Other Model
struct Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
    }
}

// MARK: - Stat Model
struct Stat: Codable, Identifiable {
    let id = UUID()
    let baseStat, effort: Int
    let stat: URLObject

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement Model
struct TypeElement: Codable {
    let slot: Int
    let type: URLObject
}

// MARK: - PokemonSpecies Model
struct PokemonSpecies: Codable {
    let baseHappiness, captureRate: Int
    let color: URLObject
    let eggGroups: [URLObject]
    let evolutionChain: EvolutionChainLink
    let evolvesFromSpecies: JSONAny?
    let flavorTextEntries: [FlavorTextEntry]
    let formDescriptions: [JSONAny]
    let formsSwitchable: Bool
    let genderRate: Int
    let genera: [Genus]
    let generation, growthRate, habitat: URLObject
    let hasGenderDifferences: Bool
    let hatchCounter, id: Int
    let isBaby, isLegendary, isMythical: Bool
    let name: String
    let names: [Name]
    let order: Int
    let palParkEncounters: [PalParkEncounter]
    let pokedexNumbers: [PokedexNumber]
    let shape: URLObject
    let varieties: [Variety]

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }
}


// MARK: - EvolutionChainLink Model
struct EvolutionChainLink: Codable {
    let url: String
}

// MARK: - Genus Model
struct Genus: Codable, Identifiable {
    let id = UUID()
    let genus: String
    let language: URLObject
}

// MARK: - PalParkEncounter Model
struct PalParkEncounter: Codable {
    let area: URLObject
    let baseScore, rate: Int

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

// MARK: - PokedexNumber Model
struct PokedexNumber: Codable {
    let entryNumber: Int
    let pokedex: URLObject

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

// MARK: - Variety Model
struct Variety: Codable {
    let isDefault: Bool
    let pokemon: URLObject

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}

// MARK: - Characteristic Model
struct Characteristic: Codable {
    let descriptions: [Description]
    let geneModulo: Int
    let highestStat: URLObject
    let id: Int
    let possibleValues: [Int]

    enum CodingKeys: String, CodingKey {
        case descriptions
        case geneModulo = "gene_modulo"
        case highestStat = "highest_stat"
        case id
        case possibleValues = "possible_values"
    }
}

// MARK: - Description Model
struct Description: Codable {
    let description: String
    let language: URLObject
}

// MARK: - EggGroup Model
struct EggGroup: Codable {
    let id: Int
    let name: String
    let names: [Name]
    let pokemonSpecies: [URLObject]

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - GrowthRate Model
struct GrowthRate: Codable {
    let descriptions: [Description]
    let formula: String
    let id: Int
    let levels: [Level]
    let name: String
    let pokemonSpecies: [URLObject]

    enum CodingKeys: String, CodingKey {
        case descriptions, formula, id, levels, name
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - Level Model
struct Level: Codable {
    let experience, level: Int
}

// MARK: - PokemonNature Model
struct PokemonNature: Codable {
    let decreasedStat, hatesFlavor: URLObject?
    let id: Int
    let increasedStat, likesFlavor: URLObject?
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

// MARK: - MoveBattleStylePreference Model
struct MoveBattleStylePreference: Codable {
    let highHPPreference, lowHPPreference: Int
    let moveBattleStyle: URLObject

    enum CodingKeys: String, CodingKey {
        case highHPPreference = "high_hp_preference"
        case lowHPPreference = "low_hp_preference"
        case moveBattleStyle = "move_battle_style"
    }
}


// MARK: - PokeathlonStatChange Model
struct PokeathlonStatChange: Codable {
    let maxChange: Int
    let pokeathlonStat: URLObject

    enum CodingKeys: String, CodingKey {
        case maxChange = "max_change"
        case pokeathlonStat = "pokeathlon_stat"
    }
}
