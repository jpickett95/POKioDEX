//
//  CommonModels.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct Description: Codable {
    let description: String     // localized description for an API resource in a specific language
    let language: Language      // language this desscription is in
    
    static var sample = Description(description: "", language: Language.sample)
}

struct Language: Codable {
    let id: Int             // identifier
    let name: String        // resource name
    let official: Bool      // whether or not games are published in this language
    let iso639: String      // two-letter code of the country where this language is spoken (NOT unique)
    let iso3166: String     // two-letter code of the language (NOT unique)
    //let names: [Name]       // name of this resource listed in different languages
    
    static var sample = Language(id: 0, name: "English", official: true, iso639: "", iso3166: "")
}

struct Name: Codable {
    let name: String            // localized name for an API resource in a specific language
    let language: Language      // language this name is in
    
    static var sample = Name(name: "", language: Language.sample)
}

struct Effect: Codable {
    let effect: String          // localized effect text for an API resource in a specific language
    let language: Language      // language this effect is in
    
    static var sample = Effect(effect: "", language: Language.sample)
}

struct VerboseEffect: Codable {
    let effect: String          // localized effect text for an API resource in a specific language
    let short_effect: String    // localized effect text in brief
    let language: Language      // language this effect is in
    
    static var sample = VerboseEffect(effect: "", short_effect: "", language: Language.sample)
}

struct Encounter: Codable {
    let min_level: Int                                  // lowest level the Pokemon could be encountered at
    let max_level: Int                                  // highest level the Pokemon could be encountered at
    let condition_values: [EncounterConditionValue]     // list of condition values that must be in effect for this encounter to occur
    let chance: Int                                     // percent chance that this encounter will occur
    let method: EncounterMethod                         // the method by which this encounter happens
}

struct EncounterConditionValue: Codable {
    let id: Int                             // identifier
    let name: String                        // resource name
    let condition: EncounterCondition       // the condition this encounter condition value pertains to
    let names: [Name]                       // name of this resource listed in different languages
}

struct EncounterCondition: Codable {
    let id: Int                                 // identifier
    let name: String                            // resource name
    let names: [Name]                           // name of this resource listed in different languages
    let values: [EncounterConditionValue]       // list of possible values for this encounter condition
}

struct EncounterMethod: Codable {
    let id: Int             // identifier
    let name: String        // resource name
    let order: Int          // a good value for sorting
    let names: [Name]       // name of this resource listed in different languages
}

struct FlavorText: Codable {
    let flavor_text: String     // localized flavor text of an API resource in aa specific language
                                // NOTE: this  text is left unprocessed as it is found in game files. It may contain special characters that one might want to replace with their visible decodable version.
                                // more info at:    github.com/veekun/pokedex/issues/218#issuecomment-339841781
    let language: Language      // language this resource is in
    let version: Version        // game version this flavor text is extracted from
    
    static var sample = FlavorText(flavor_text: "lorem ipsult....", language: Language.sample, version: Version.sample)
}

struct VersionGroupFlavorText: Codable {
    let text: String                    // localizef name for an API resource in a specific language
    let language: Language              // language this name is in
    let version_group: VersionGroup     // version group which uses this flavor text
}

struct Version: Codable {
    let id: Int                         // identifier
    let name: String                    // resource name
    let names: [Name]                   // name of this resource listed in different languages
    let version_group: VersionGroup     // version group this version belongs to
    
    static var sample = Version(id: 0, name: "", names: [Name](), version_group: VersionGroup.sample)
}

struct VersionGroup: Codable {
    let id: Int                                     // identifier
    let name: String                                // resource name
    let order: Int                                  // order for sorting (almost be date of release, except similar versions are grouped together)
    //let generation: Generation                      // generation this version belongs to
    //let move_learn_methods: [MoveLearnMethod]       // list of methods in which Pokemon can larn moves in this version group
    //let pokedexes: [Pokedex]                        // list of pokedexes introduced in this version group
    //let regions: [Region]                           // a list of regions that can be visited in this version group
    //let versions: [Version]                         // list of versions this version group owns
    
    static var sample = VersionGroup(id: 0, name: "", order: 0)
}

struct VersionEncounterDetail: Codable {
    let version: Version                    // game version this encounter happens in
    let max_chance: Int                     // total percentage of all encounter potential
    let encounter_details: [Encounter]      // list of encounters and their specifics
}

struct VersionGameIndex: Codable {
    let game_index: Int         // internal id of an API resource within game data
    let version: Version        // version relevant to this game index
}

class Generation: Codable {                     // 'class' because contains recursive properties
    let id: Int                                 // identifier
    let name: String                            // resource name
    let abilities: [Ability]                    // list of abilities that were introduced in this generation
    let names: [Name]                           // name of this resource listed in different languages
    let main_region: Region                     // main region travelled in this generation
    let moves: [PokemonMove]                    // list of moves introduced in this generation
    let pokemon_species: [PokemonSpecies]       // list of Pokemon species that were introduced in this generation
    let types: [PokemonTypes]                   // list of types that were introduced in this generation
    let version_groups: [VersionGroup]          // list of version groups introdcued in this generation
}

struct GenerationGameIndex: Codable {
    let game_index: Int             // internal id of an API resource wihtin game data
    let generation: Generation      // generation relevant to this game index
}




