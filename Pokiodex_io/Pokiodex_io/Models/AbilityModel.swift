//
//  AbilityModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct Ability: Codable {
    let id: Int                                         // identifier
    let name: String                                    // resource name
    let is_main_series: Bool                            // whether or no thiw ability orginated in the main series of the video games
    let generation: Generation                          // generation this ability orginated in
    let names: [Name]                                   // name of this resource listed in different languages
    let effect_entries: [VerboseEffect]                 // effect of this ability listed in different languages
    let effect_changes: [AbilityEffectChange]           // list of previous effects this ability has had across version groups
    let flavor_text_entries: [AbilityFlavorText]        // flavor text of this ability listed in different languages
    let pokemon: [AbilityPokemon]                       // list of Pokemon that could potentially have this ability
}

struct AbilityEffectChange: Codable {
    let effect_entries: [Effect]        // previous effect of this ability listed in different languages
    let version_group: VersionGroup     // version group in which the previous effect of this ability orginated
}

struct AbilityFlavorText: Codable {
    let flavor_text: String                 // localized name for an API resource in a specific language
    let language: Language                  // language this text resource is in
    let version_group: VersionGroup         // version group that uses this flavor text
}

struct AbilityPokemon: Codable {
    let is_hidden: Bool         // whether or not thi is a hidden ability for the referenced Pokemon
    let slot: Int               // Pokemon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced Pokemon
    let pokemon: PokemonDetails        // the Pokemon this ability could belong to
}
