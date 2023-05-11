//
//  TypeModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/9/23.
//

import Foundation

struct TypePokemon: Codable {
    let slot: Int?                  // The order the Pokémon's types are listed in.
    let pokemon: [PokemonDetails]?   // The Pokémon that has the referenced type.
    
    static var sample = TypePokemon(slot: 0, pokemon: [PokemonDetails]())
}

struct TypeRelations: Codable {
    let no_damage_to: [TypeRelationsType]?                // A list of types this type has no effect on.
    let half_damage_to: [TypeRelationsType]?              // A list of types this type is not very effective against.
    let double_damage_to: [TypeRelationsType]?            // A list of types this type is very effective against.
    let no_damage_from: [TypeRelationsType]?              // A list of types that have no effect on this type.
    let half_damage_from: [TypeRelationsType]?            // A list of types that are not very effective against this type.
    let double_damage_from: [TypeRelationsType]?          // A list of types that are very effective against this type
    
    static var sample = TypeRelations(no_damage_to: [TypeRelationsType](), half_damage_to: [TypeRelationsType](), double_damage_to: [TypeRelationsType](), no_damage_from: [TypeRelationsType](), half_damage_from: [TypeRelationsType](), double_damage_from: [TypeRelationsType]())
    
    enum CodingKeys: String, CodingKey {
        case no_damage_to
        case half_damage_to
        case double_damage_to
        case no_damage_from
        case half_damage_from
        case double_damage_from
    }
}

struct TypeRelationsPast: Codable {
    //let generation: Generation?                  // The last generation in which the referenced type had the listed damage relations
    let damage_relations: TypeRelations?         // The damage relations the referenced type had up to and including the listed generation
}

struct TypeRelationsType: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}
