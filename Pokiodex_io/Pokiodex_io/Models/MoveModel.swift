//
//  MoveModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

struct MovesList: Codable {
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

struct MoveDetails: Codable {
    let id: Int
    let name: String
    let accuracy: Int
    let effect_chance: Int
    let pp: Int
    let priority: Int
    let power: Int
    let learned_by_pokemon: [Pokemon]
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
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        //accuracy = try values.decode(Int.self, forKey: .accuracy)
        //pp = try values.decode(Int.self, forKey: .pp)
        priority = try values.decode(Int.self, forKey: .priority)
        //power = try values.decode(Int.self, forKey: .power)
        learned_by_pokemon = try values.decode([Pokemon].self, forKey: .learned_by_pokemon)
        
        // Api may return 'null' for effect_chance
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
    init(id: Int, name: String, accuracy: Int, effect_chance: Int, pp: Int, priority: Int, power: Int) {
        self.id = id
        self.name = name
        self.accuracy = accuracy
        self.effect_chance = effect_chance
        self.pp = pp
        self.priority = priority
        self.power = power
        self.learned_by_pokemon = [Pokemon.samplePokemon]
    }
}

struct MoveDamageClass: Codable {
    let id: Int
    let name: String
    let move: [PokemonMove]
}

struct MoveLearnMethod: Codable {
    let id: Int                             // identifier
    let name: String                        // resource name
    let descriptions: [Description]         // descriptions for this resource in different languages
    let names: [Name]                       // names for this resource in different languages
    let version_groups: [VersionGroup]      // list of version groups where moves can be learned through this method
}

