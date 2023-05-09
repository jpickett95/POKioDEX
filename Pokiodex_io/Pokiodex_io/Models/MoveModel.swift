//
//  MoveModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

struct MovesList: Codable {     // API endpoint: https://pokeapi.co/api/v2/move/ ; returns paginated list
    let count: Int
    let results: [PokemonMove]
    
    //let next: String          // not valid
    //let previous: String      // not valid
}

struct PokemonMove: Codable, Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let url: String
    
    static var sample = PokemonMove(name: "pound", url:"https://pokeapi.co/api/v2/move/1/")
}

struct MoveDetails: Codable {   // Named API Resource: "Move"
    let id: Int?                                     // resource identifier
    let name: String?                                // resource name
    let accuracy: Int?                               // percent value of how likely this move is to be successful
    let effect_chance: Int?                          // the percent value of how likely it is this move's effect will happen
    let pp: Int?                                     // power points; number of times this move can be used
    let priority: Int?                               // a value between -8 & 8; Sets the order in which move are executed during battle
    let power: Int?                                  // base power of this move, with a value of 0 if it does not have a base value
    let learned_by_pokemon: [PokemonDetails]?        // list of pokemon that can learn this move
    
    static var sample = MoveDetails(id: 0, name: "", accuracy: 0, effect_chance: 0, pp: 0, priority: 0, power: 0)
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case accuracy = "accuracy"
        case effect_chance = "effect_chance"
        case pp = "pp"
        case priority = "priority"
        case power = "power"
        case learned_by_pokemon = "learned_by_pokemon"
    }
    
    // Decoder for 'null' values from api
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        // Api may return 'null'
        if let learned_by_pokemon = try values.decodeIfPresent([PokemonDetails].self, forKey: .learned_by_pokemon){
            self.learned_by_pokemon = learned_by_pokemon
        } else {self.learned_by_pokemon = [PokemonDetails]()}
        if let name = try values.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        } else {self.name = ""}
        if let priority = try values.decodeIfPresent(Int.self, forKey: .priority) {
            self.priority = priority
        } else {self.priority = 0}
        if let id = try values.decodeIfPresent(Int.self, forKey: .id){
            self.id = id
        } else {self.id = 0}
        if let chance = try values.decodeIfPresent(Int.self, forKey: .effect_chance){
            self.effect_chance = chance
        } else {self.effect_chance = 0}
        if let power = try values.decodeIfPresent(Int.self, forKey: .power){
            self.power = power
        } else {self.power = 0}
        if let accuracy = try values.decodeIfPresent(Int.self, forKey: .accuracy){
            self.accuracy = accuracy
        } else {self.accuracy = 0}
        if let pp = try values.decodeIfPresent(Int.self, forKey: .pp){
            self.pp = pp
        } else {self.pp = 0}
    }
    
    // initializer for 'sample' variable
    init(id: Int, name: String, accuracy: Int, effect_chance: Int, pp: Int, priority: Int, power: Int) {
        self.id = id
        self.name = name
        self.accuracy = accuracy
        self.effect_chance = effect_chance
        self.pp = pp
        self.priority = priority
        self.power = power
        self.learned_by_pokemon = [PokemonDetails.sampleDetails]
    }
}

struct MoveDamageClass: Codable {
    let id: Int?                         // resource identifier
    let name: String                    // resource name
    let descriptions: [Description]?     // resource decription listed in different languages
    let names: [Name]?                   // resource name listed in different languages
    let move: [PokemonMove]?             // list of moves that fall into this damage class
}

struct MoveLearnMethod: Codable {
    let id: Int?                             // resource identifier
    let name: String                        // resource name
    let descriptions: [Description]?         // descriptions for this resource in different languages
    let names: [Name]?                       // names for this resource in different languages
    let version_groups: [VersionGroup]?      // list of version groups where moves can be learned through this method
}

