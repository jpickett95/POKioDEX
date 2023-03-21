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
