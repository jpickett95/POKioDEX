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
    let abilities: [PokemonAbility] // A list of abilities this Pokémon could potentially have.
    let species: PokemonSpecies     // The species this Pokémon belongs to.
    let sprites: PokemonSprites     // A set of sprites used to depict this Pokémon in the game. A visual representation of the various sprites can be found at https://github.com/PokeAPI/sprites#sprites
    let moves: [PokemonLearnedMove] // A list of moves along with learn methods and level details pertaining to specific version groups.
    
    static var sampleDetails = PokemonDetails(id: 1, name: "Bulbasaur", height: 7, weight: 69, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat.sample)], types: [PokemonTypes(slot: 0, type: SpecificType.sample)], abilities: [PokemonAbility.sample], species: PokemonSpecies.sample, sprites: PokemonSprites.sample, moves: [PokemonLearnedMove]())
}

struct PokemonStats: Codable, Identifiable {      // Named API Resource: "PokemonStat"; 'Identifiable' because of stat ForEach loop in PokemonDetailsView
    let id = UUID()
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
    let moves: [MoveDetails]?            // list of moves that have this type
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
    let id: Int?                                 // identifier
    let name: String                            // resource name
    let order: Int                              // order species should be sorted. Based on National dex order, except families are grouped together and sorted by stage
    let gender_rate: Int                        // chances of this Pokemon being female, in eights; or -1 for genderless
    let capture_rate: Int                       // base capture rate; up to 255. Higher the number, easier to catch
    let base_happiness: Int                     // happiness when caught by a normal pokeball; up to 255. The higher the number, happier the pokemon
    let is_baby: Bool                           // whether or not this is a baby pokemon
    let is_legendary: Bool                      // whether or not this is a legendary pokemon
    let is_mythical: Bool                       // whether or not this is a mythical pokemon
    let hatch_counter: Int                      // initial hatch counter: one must walk 255 x (hatch_counter + 1) steps before this Pokemon's egg hatches, unless utilizing bonuses like Flame Body's
    let has_gender_differences: Bool            // whether or not this pokemon has visual gender differences
    let forms_switchable: Bool                  // whether or not this pokemon has multiple forms and can switch between them
    let flavor_text_entries: [FlavorText]       // list of flavor text entries for this species
    
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
    
    let form_descriptions: [Description]        // descriptions of different forms pokemon take on within this species
    let genera: [Genus]     // genus of this Pokemon species listed in multiple languages
    let varieties: [PokemonSpeciesVariety]      // list of Pokemon that exist within this species
    */
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case order = "order"
        case gender_rate = "gender_rate"
        case capture_rate = "capture_rate"
        case base_happiness = "base_happiness"
        case is_baby = "is_baby"
        case is_legendary = "is_legendary"
        case is_mythical = "is_mythical"
        case hatch_counter = "hatch_counter"
        case has_gender_differences = "has_gender_differences"
        case forms_switchable = "forms_switchable"
        case flavor_text_entries = "flavor_text_entries"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let id = try values.decodeIfPresent(Int.self, forKey: .id){
            self.id = id
        } else {self.id = 0}
        if let name = try values.decodeIfPresent(String.self, forKey: .name){
            self.name = name
        } else {self.name = ""}
        if let order = try values.decodeIfPresent(Int.self, forKey: .order){
            self.order = order
        } else {self.order = 0}
        if let gender_rate = try values.decodeIfPresent(Int.self, forKey: .gender_rate){
            self.gender_rate = gender_rate
        } else {self.gender_rate = 0}
        if let capture_rate = try values.decodeIfPresent(Int.self, forKey: .capture_rate){
            self.capture_rate = capture_rate
        } else {self.capture_rate = 0}
        if let base_happiness = try values.decodeIfPresent(Int.self, forKey: .base_happiness){
            self.base_happiness = base_happiness
        } else {self.base_happiness = 0}
        if let is_baby = try values.decodeIfPresent(Bool.self, forKey: .is_baby){
            self.is_baby = is_baby
        } else {self.is_baby = false}
        if let is_legendary = try values.decodeIfPresent(Bool.self, forKey: .is_legendary){
            self.is_legendary = is_legendary
        } else {self.is_legendary = false}
        if let is_mythical = try values.decodeIfPresent(Bool.self, forKey: .is_mythical){
            self.is_mythical = is_mythical
        } else {self.is_mythical = false}
        if let hatch_counter = try values.decodeIfPresent(Int.self, forKey: .hatch_counter){
            self.hatch_counter = hatch_counter
        } else {self.hatch_counter = 0}
        if let has_gender_differences = try values.decodeIfPresent(Bool.self, forKey: .has_gender_differences){
            self.has_gender_differences = has_gender_differences
        } else {self.has_gender_differences = false}
        if let forms_switchable = try values.decodeIfPresent(Bool.self, forKey: .forms_switchable){
            self.forms_switchable = forms_switchable
        } else {self.forms_switchable = false}
        if let flavor_text_entries = try values.decodeIfPresent([FlavorText].self, forKey: .flavor_text_entries){
            self.flavor_text_entries = flavor_text_entries
        } else {self.flavor_text_entries = [FlavorText]()}
    }
    
    init(id: Int, name: String, order: Int, gender_rate: Int, capture_rate: Int, base_happiness: Int, is_baby: Bool, is_legendary: Bool, is_mythical: Bool, hatch_counter: Int, has_gender_differences: Bool, forms_switchable: Bool, flavor_text_entries: [FlavorText]) {
        self.id = id
        self.name = name
        self.order = order
        self.gender_rate = gender_rate
        self.capture_rate = capture_rate
        self.base_happiness = base_happiness
        self.is_baby = is_baby
        self.is_legendary = is_legendary
        self.is_mythical = is_mythical
        self.hatch_counter = hatch_counter
        self.has_gender_differences = has_gender_differences
        self.forms_switchable = forms_switchable
        self.flavor_text_entries = flavor_text_entries
    }
    
    static var sample = PokemonSpecies(id: 0, name: "", order: 0, gender_rate: 0, capture_rate: 0, base_happiness: 0, is_baby: true, is_legendary: false, is_mythical: false, hatch_counter: 0, has_gender_differences: false, forms_switchable: false, flavor_text_entries: [FlavorText]())
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

struct PokemonSprites: Codable {
    let front_default: String           // The default depiction of this Pokémon from the front in battle.
    let front_shiny: String             // The shiny depiction of this Pokémon from the front in battle.
    let front_female: String?            // The female depiction of this Pokémon from the front in battle.
    let front_shiny_female: String?      // The shiny female depiction of this Pokémon from the front in battle.
    let back_default: String            // The default depiction of this Pokémon from the back in battle.
    let back_shiny: String              // The shiny depiction of this Pokémon from the back in battle.
    let back_female: String?             // The female depiction of this Pokémon from the back in battle.
    let back_shiny_female: String?       // The shiny female depiction of this Pokémon from the back in battle.
    let other: OtherSprites?
    
    static var sample = PokemonSprites(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png", front_female: "", front_shiny_female: "", back_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png", back_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png", back_female: "", back_shiny_female: "", other: OtherSprites.sample)
}

struct OtherSprites: Codable {
    let dream_world: DreamWorld
    let home: HomeSprite
    let official_artwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case dream_world
        case home
        case official_artwork = "official-artwork"
    }
    
    static var sample = OtherSprites(dream_world: DreamWorld.sample, home: HomeSprite.sample, official_artwork: OfficialArtwork.sample)
}

struct DreamWorld: Codable {
    let front_default: String
    let front_female: String?
    
    static var sample = DreamWorld(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg", front_female: "")
}

struct HomeSprite: Codable {
    let front_default: String
    let front_female: String?
    let front_shiny: String
    let front_shiny_female: String?
    
    static var sample = HomeSprite(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png", front_female: "", front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png", front_shiny_female: "")
}

struct OfficialArtwork: Codable {
    let front_default: String
    let front_shiny: String
    
    static var sample = OfficialArtwork(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png")
}


struct PokemonLearnedMove: Codable, Identifiable {
    let id = UUID()
    let move: MoveDetails                                   // The move the Pokémon can learn.
    let version_group_details: [PokemonMoveVersion]         // The details of the version in which the Pokémon can learn the move.
}

struct PokemonMoveVersion: Codable {
    let move_learn_method: MoveLearnMethod      // The method by which the move is learned.
    let version_group: VersionGroup             // The version group in which the move is learned.
    let level_learned_at: Int?                  // The minimum level to learn the move.
    
}
