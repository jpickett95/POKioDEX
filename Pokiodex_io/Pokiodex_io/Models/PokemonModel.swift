//
//  PokemonModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct PokemonDetails: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    
    static var sampleDetails = PokemonDetails(id: 1, height: 7, weight: 69, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "", url: ""))], types: [PokemonTypes(slot: 0, type: SpecificType(name: "", url: ""))])
}

struct PokemonStats: Codable {
    let base_stat: Int
    let effort: Int
    let stat: SpecificStat
}

struct SpecificStat: Codable {
    let name: String
    let url: String
}

struct PokemonTypes: Codable {
    let slot: Int
    let type: SpecificType
}

struct SpecificType: Codable {
    let name: String
    let url: String
    
    static var sample = SpecificType(name: "grass", url: "https://pokeapi.co/api/v2/type/12/")
}

struct PokemonSpecies: Codable {
    let id: Int                         // identifier
    let name: String                    // resource name
    let order: Int                      // order species should be sorted. Based on National dex order, except families are grouped together and sorted by stage
    let gender_rate: Int                // chances of this Pokemon being female, in eights; or -1 for genderless
    let capture_rate: Int               // base capture rate; up to 255. Higher the number, easier to catch
    let base_happiness: Int             // happiness when caught by a normal pokeball; up to 255. The higher the number, happier the pokemon
    let is_baby: Bool                   // whether or not this is a baby pokemon
    let is_legendary: Bool              // whether or not this is a legendary pokemon
    let is_mythical: Bool               // whether or not this is a mythical pokemon
    let hatch_counter: Int              // initial hatch counter: one must walk 255 x (hatch_counter + 1) steps before this Pokemon's egg hatches, unless utilizing bonuses like Flame Body's
    let has_gender_differences: Bool    // whether or not this pokemon has visual gender differences
    let forms_switchable: Bool          // whether or not this pokemon has multiple forms and can switch between them
    
    /*
    let growth_rate: GrowthRate         // rate at which this species gains levels
    let pokedex_numbers: [PokemonSpeciesDexEntry]          // list of pokedexes & indexes reserved within them for this species
    let egg_groups: [EggGroup]      // list of egg groups this species is a member of
    let color: PokemonColor         // color for Pokedex search
    let shape: PokemonShape         // shape for Pokedex search
    let evolves_from_species: PokemonSpecies    // pokemon species that eolves into this species
    let evolution_chain: EvolutionChain     // evolution chain this species is a part of
    let habitat: PokemonHabitat     // habitat this species can be encountered in
    let generation: Generation      // generation this species was introduced in
    let names: [Name]       // name of resource listed in different languages
    let pal_park_encounters: [PalParkEncounterArea]     // list of encounters that can be had with this species in Pal Park
    let flavor_text_entries: [FlavorText]       // list of flavor text entries for this species
    let form_descriptions: [Description]        // descriptions of different forms pokemon take on within this species
    let genera: [Genus]     // genus of this Pokemon species listed in multiple languages
    let varieties: [PokemonSpeciesVariety]      // list of Pokemon that exist within this species
    */
}
