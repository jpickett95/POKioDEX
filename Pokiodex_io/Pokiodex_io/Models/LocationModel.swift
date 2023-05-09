//
//  LocationModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct Location: Codable {
    let id: Int?                                     // identifier
    let name: String                                // resource name
    let region: Region?                              // region this location can be found in
    let names: [Name]?                               // rources name listed in different languages
    let game_indices: [GenerationGameIndex]?         // list of gme indices relevant to this location by generation
    let areas: [LocationArea]?                       // areas that can be found within this location
}

struct Region: Codable {
    let id: Int?                                 // identifier
    let locations: [Location]?                   // list of locations that can be found in this region
    let name: String                            // resource name
    let names: [Name]?                           // resource name listed in different languages
    let main_generation: Generation?             // generation this region was introduced in
    let pokedexes: [Pokedex]?                    // list of Pokedexes that catalogue Pokemon in this region
    let version_groups: [VersionGroup]?          // list of version groups where this region can be visited
}

struct LocationArea: Codable {
    let id: Int?                                             // identifier
    let name: String                                        // resource name
    let game_index: Int?                                     // internal id of an API resource within game data
    let encounter_method_rates: [EncounterMethodRate]?       // list of methods in which pokemon may be encounteres in this area and how likely the method will occur depending on the version of the game
    let location: Location?                                  // region this location area can be found in
    let names: [Name]?                                       // resource name listed in different languages
    let pokemon_encounters: [PokemonEncounter]?              // list of pokemon that can be encountered in this area along with version specific details about the encounter.
}

struct EncounterMethodRate: Codable {
    let encounter_method: EncounterMethod               // method in which pokemon may be encountered in an area
    let version_details: [EncounterVersionDetails]      // chance of the encounter to occur on a version of the game
}

struct PokemonEncounter: Codable {
    let pokemon: PokemonDetails?                         // Pokemon being encountered
    let version_details: [VersionEncounterDetail]?       // list of versions & encounters with Pokemon that might happen in the referenced location area
}

struct EncounterVersionDetails: Codable {
    let rate: Int               // chance of an encounter to occur
    let version: Version?        // version of the game in which the encounter can occur with the given chance
}


struct ParkPalArea: Codable {
    let id: Int                                             // identifier
    let name: String                                        // resource name
    let names: [Name]                                       // resource name listed in different languages
    let pokemon_encounters: [PalParkEncounterSpecies]       // list of pokemon encountered in this pal park area along with details
}

struct PalParkEncounterSpecies: Codable {
    let base_score: Int                     // base score given to the player when this Pokemon is caught during a pal park run
    let rate: Int                           // base rate for encountering this pokemon in this pal park area
    let pokemon_species: PokemonSpecies     // pokemon species being encountered
}

struct LocationAreaEncounter: Codable, Identifiable {
    let id = UUID()
    let location_area: LocationArea?                     // The location area the referenced Pokémon can be encountered in.
    let version_details: [VersionEncounterDetail]?         // A list of versions and encounters with the referenced Pokémon that might happen.
}
