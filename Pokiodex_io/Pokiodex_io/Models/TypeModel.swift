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
    let no_damage_to: [SpecificType]?                // A list of types this type has no effect on.
    let half_damage_to: [SpecificType]?              // A list of types this type is not very effective against.
    let double_damage_to: [SpecificType]?            // A list of types this type is very effective against.
    let no_damage_from: [SpecificType]?              // A list of types that have no effect on this type.
    let half_damage_from: [SpecificType]?            // A list of types that are not very effective against this type.
    let double_damage_from: [SpecificType]?          // A list of types that are very effective against this type
    
    static var sample = TypeRelations(no_damage_to: [SpecificType](), half_damage_to: [SpecificType](), double_damage_to: [SpecificType](), no_damage_from: [SpecificType](), half_damage_from: [SpecificType](), double_damage_from: [SpecificType]())
}

struct TypeRelationsPast: Codable {
    //let generation: Generation?                  // The last generation in which the referenced type had the listed damage relations
    let damage_relations: TypeRelations?         // The damage relations the referenced type had up to and including the listed generation
}
