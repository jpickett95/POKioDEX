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
    //let learned_by_pokemon: [Pokemon]
}
