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
    //let generation: Generation                          // generation this ability orginated in
    //let names: [Name]                                   // name of this resource listed in different languages
    let effect_entries: [VerboseEffect]                 // effect of this ability listed in different languages
    let effect_changes: [AbilityEffectChange]           // list of previous effects this ability has had across version groups
    let flavor_text_entries: [AbilityFlavorText]        // flavor text of this ability listed in different languages
    //let pokemon: [AbilityPokemon]                       // list of Pokemon that could potentially have this ability
    
    static var sample = Ability(id: 0, name: "Overgrow", is_main_series: true, effect_entries: [VerboseEffect.sample], effect_changes: [AbilityEffectChange.sample], flavor_text_entries: [AbilityFlavorText.sample]/*, pokemon: [AbilityPokemon.sample]*/)
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case is_main_series = "is_main_series"
        case id = "id"
        case effect_entries = "effect_entries"
        case effect_changes = "effect_changes"
        case flavor_text_entries = "flavor_text_entries"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Api may return 'null' for effect_chance
        if let name = try values.decodeIfPresent(String.self, forKey: .name){
            self.name = name
        } else {self.name = ""}
        if let is_main_series = try values.decodeIfPresent(Bool.self, forKey: .is_main_series){
            self.is_main_series = is_main_series
        } else {self.is_main_series = true}
        if let id = try values.decodeIfPresent(Int.self, forKey: .id){
            self.id = id
        } else {self.id = 0}
        if let effect_changes = try values.decodeIfPresent([AbilityEffectChange].self, forKey: .effect_changes){
            self.effect_changes = effect_changes
        } else {self.effect_changes = [AbilityEffectChange]()}
        if let effect_entries = try values.decodeIfPresent([VerboseEffect].self, forKey: .effect_entries){
            self.effect_entries = effect_entries
        } else {self.effect_entries = [VerboseEffect]()}
        if let flavor_text_entries = try values.decodeIfPresent([AbilityFlavorText].self, forKey: .flavor_text_entries){
            self.flavor_text_entries = flavor_text_entries
        } else {self.flavor_text_entries = [AbilityFlavorText]()}
    }
    
    init(id: Int, name: String, is_main_series: Bool, effect_entries: [VerboseEffect], effect_changes: [AbilityEffectChange], flavor_text_entries: [AbilityFlavorText]) {
        self.name = name
        self.is_main_series = is_main_series
        self.id = id
        self.effect_entries = effect_entries
        self.effect_changes = effect_changes
        self.flavor_text_entries = flavor_text_entries
    }
}

struct AbilityEffectChange: Codable {
    let effect_entries: [Effect]        // previous effect of this ability listed in different languages
    let version_group: VersionGroup     // version group in which the previous effect of this ability orginated
    
    static var sample = AbilityEffectChange(effect_entries: [Effect.sample], version_group: VersionGroup.sample)
}

struct AbilityFlavorText: Codable {
    let flavor_text: String                 // localized name for an API resource in a specific language
    let language: Language                  // language this text resource is in
    let version_group: VersionGroup         // version group that uses this flavor text
    
    static var sample = AbilityFlavorText(flavor_text: "", language: Language.sample, version_group: VersionGroup.sample)
}

struct AbilityPokemon: Codable {
    let is_hidden: Bool         // whether or not thi is a hidden ability for the referenced Pokemon
    let slot: Int               // Pokemon have 3 ability 'slots' which hold references to possible abilities they could have. This is the slot of this ability for the referenced Pokemon
    let pokemon: PokemonDetails        // the Pokemon this ability could belong to
    
    static var sample = AbilityPokemon(is_hidden: false, slot: 0, pokemon: PokemonDetails.sampleDetails)
}
