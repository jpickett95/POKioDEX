//
//  PokemonModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import Foundation

struct PokemonList: Codable {   // paginated list returned from enpoint https://pokeapi.co/api/v2/pokemon/
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

struct PokemonDetails: Codable, Identifiable {  // API NamedResource: "Pokemon"
    // API endpoint: https://pokeapi.co/api/v2/pokemon/{id or name}/
    let id: Int                     // resource identifier
    let name: String                // resource name
    let height: Int                 // Pokemon height in decimeters
    let weight: Int                 // Pokemon weight in hectograms
    let stats: [PokemonStats]       // list of base stat vaalues for this Pokemon
    let types: [PokemonTypes]       // list of details showing types this Pokemon has
    let abilities: [PokemonAbility]
    
    static var sampleDetails = PokemonDetails(id: 1, name: "Bulbasaur", height: 7, weight: 69, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat.sample)], types: [PokemonTypes(slot: 0, type: SpecificType.sample)], abilities: [PokemonAbility.sample])
}

struct PokemonStats: Codable {      // Named API Resource: "PokemonStat"
    let base_stat: Int              // base value of the stat
    let effort: Int                 // the effort points (EV) the Pokemon has in the stat
    let stat: SpecificStat          // the stat the Pokemon has
}

struct SpecificStat: Codable {      // Named API Resource: "Stat"
    let id: Int                     // resource identifier
    let name: String                // resource number
    let game_index: Int             // ID the game uses for this stat
    let is_battle_only: Bool        // whether this stat only exists within a battle
    let names: [Name]               // resource name listed in different languages
    let url: String
    static var sample = SpecificStat(name: "", url: "", id: 0, game_index: 0, is_battle_only: false)
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case id = "id"
        case game_index = "game_index"
        case is_battle_only = "is_battle_only"
        case names = "names"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Api may return 'null' for effect_chance
        if let name = try values.decodeIfPresent(String.self, forKey: .name){
            self.name = name
        } else {self.name = ""}
        if let id = try values.decodeIfPresent(Int.self, forKey: .id){
            self.id = id
        } else {self.id = 0}
        if let game_index = try values.decodeIfPresent(Int.self, forKey: .game_index){
            self.game_index = game_index
        } else {self.game_index = 0}
        if let is_battle_only = try values.decodeIfPresent(Bool.self, forKey: .is_battle_only){
            self.is_battle_only = is_battle_only
        } else {self.is_battle_only = false}
        if let names = try values.decodeIfPresent([Name].self, forKey: .names){
            self.names = names
        } else {self.names = [Name]()}
        if let url = try values.decodeIfPresent(String.self, forKey: .url){
            self.url = url
        } else {self.url = ""}
    }
    
    init(name: String, url: String, id: Int, game_index: Int, is_battle_only: Bool) {
        self.name = name
        self.url = url
        self.id = id
        self.game_index = game_index
        self.is_battle_only = is_battle_only
        self.names = [Name]()
    }
    
}

struct PokemonTypes: Codable {  // API Name: "PokemonType"
    let slot: Int               // order the Pokemon's types are listed in
    let type: SpecificType      // type of referenced Pokemon
}

struct SpecificType: Codable {  // Named API Resource: "Type"
    let id: Int                         // resource identifier
    let name: String                    // resource name
    let names: [Name]                   // resource name listed in different languages
    let moves: [MoveDetails]            // list of moves that have this type
    let url: String
    
    static var sample = SpecificType(name: "grass", url: "https://pokeapi.co/api/v2/type/12/", id: 12)
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case id = "id"
        case names = "names"
        case moves = "moves"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Api may return 'null' for effect_chance
        if let name = try values.decodeIfPresent(String.self, forKey: .name){
            self.name = name
        } else {self.name = ""}
        if let url = try values.decodeIfPresent(String.self, forKey: .url){
            self.url = url
        } else {self.url = ""}
        if let id = try values.decodeIfPresent(Int.self, forKey: .id){
            self.id = id
        } else {self.id = 0}
        if let names = try values.decodeIfPresent([Name].self, forKey: .names){
            self.names = names
        } else {self.names = [Name]()}
        if let moves = try values.decodeIfPresent([MoveDetails].self, forKey: .moves){
            self.moves = moves
        } else {self.moves = [MoveDetails]()}
    }
    
    init(name: String, url: String, id: Int) {
        self.name = name
        self.url = url
        self.id = id
        self.names = [Name]()
        self.moves = [MoveDetails]()
    }
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

struct Pokedex: Codable {
    let id: Int                             // identifier
    let name: String                        // resource name
    let is_main_series: Bool                // whether or not this Pokedex orginated in the main series of the video games
    let descriptions: [Description]         //description of this resource listed in different languages
    let names: [Name]                        // name of this resource liste din different languages
    let pokemon_entries: [PokemonEntry]     // list of Pokemon catalogues in this Pokedex and their indexes
    let region: Region                      // region this Pokedex catalogues Pokemon for
    let verion_groups: [VersionGroup]       // list of version groups this Pokedex belongs to
}

struct PokemonEntry: Codable {
    let entry_number: Int                   // index of this Pokemon species entry within the Pokedex
    let pokemon_species: PokemonSpecies     // the Pokemon species being encountered
}

struct PokemonAbility: Codable {
    let is_hidden: Bool             // Whether or not this is a hidden ability.
    let slot: Int                   // The slot this ability occupies in this Pokémon species.
    let ability: Ability            // The ability the Pokémon may have.
    
    static var sample = PokemonAbility(is_hidden: false, slot: 1, ability: Ability.sample)
}
