//
//  TypeModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/9/23.
//

import Foundation

// MARK: - TypeDetails
struct TypeDetails: Codable, Identifiable {
    let damageRelations: DamageRelations
    let gameIndices: [GameIndex]
    let generation: URLObject
    let id: Int
    let moveDamageClass: URLObject
    let moves: [URLObject]
    let name: String
    let names: [Name]
    let pastDamageRelations: [JSONAny]
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case gameIndices = "game_indices"
        case generation, id
        case moveDamageClass = "move_damage_class"
        case moves, name, names
        case pastDamageRelations = "past_damage_relations"
        case pokemon
    }
}

// MARK: - DamageRelations
struct DamageRelations: Codable {
    let doubleDamageFrom: [URLObject]
    let doubleDamageTo, halfDamageFrom: [URLObject]
    let halfDamageTo, noDamageFrom, noDamageTo: [URLObject]

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
        case noDamageFrom = "no_damage_from"
        case noDamageTo = "no_damage_to"
    }
}





