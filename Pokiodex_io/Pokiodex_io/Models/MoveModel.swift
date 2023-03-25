//
//  MoveModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

struct MovesList: Codable {
    let count: Int
    //let next: String
    //let previous: String
    let results: [PokemonMove]
}

struct PokemonMove: Codable, Identifiable, Equatable {
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        accuracy = try values.decode(Int.self, forKey: .accuracy)
        
        if let chance = try values.decodeIfPresent(Int.self, forKey: .effect_chance){
            self.effect_chance = chance
        } else {self.effect_chance = 0}
        
        pp = try values.decode(Int.self, forKey: .pp)
        priority = try values.decode(Int.self, forKey: .priority)
        power = try values.decode(Int.self, forKey: .power)
        learned_by_pokemon = try values.decode([Pokemon].self, forKey: .learned_by_pokemon)
    }
}
