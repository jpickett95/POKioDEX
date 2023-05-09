//
//  ItemModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

class Item: Codable {
    let id: Int?                                         // identifier
    let name: String                                    // resource name
    let cost: Int?                                      // price of this item in stores
    let fling_power: Int?                                // power of the move Fling when used with this item
    let fling_effect: ItemFlingEffect?                  // effect of the move Fling when used with this item
    let attributes: [ItemAttribute]?                     // list of attributes this item has
    let category: ItemCategory?                          // category of items this item falls into
    let effect_entries: [VerboseEffect]?                 // effect of this ability listed in different languages
    let flavor_text_entries: [VersionGroupFlavorText]?   // flavor text of this ability listed in different languages
    let game_indices: [GenerationGameIndex]?             // list of game indices relevant to this item by generation
    let names: [Name]?                                   // resource name listed in different languages
    let sprites: ItemSprites?                            // set of sprites used to depict this item in game
    let held_by_pokemon: [ItemHolderPokemon]?            // list of pokemon that might be found in the wild holding this item
    let baby_trigger_for: EvolutionChain?                // an evolution chain this item requires to produce a baby during mating
    let machines: [MachineVersionDetail]?                // list of machines related to this item
}

struct ItemFlingEffect: Codable {
    let id: Int?                         // identifier
    let name: String                    // resource name
    let effect_entries: [Effect]?        // result of this fling effect listed in different languages
    let items: [Item]?                   // list of items that have this fling effect
}

struct ItemAttribute: Codable {
    let id: Int?                         //identifier
    let name: String                    // resource name
    let items: [Item]?                   // list of items that have this attribute
    let names: [Name]?                   // resource name listed in different languages
    let descriptions: [Description]?     // description of this item attribute listed in different languages
}

struct ItemCategory: Codable {
    let id: Int?                 // identifier
    let name: String            // resource name
    let items: [Item]           // list of items that are a part of this category
    let names: [Name]           // resource name listed in different languages
    let pocket: ItemPocket?      // the pocket items in this category would be put in
}

struct ItemPocket: Codable {
    let id: Int?                         // identifier
    let name: String                    // resource name
    let categories: [ItemCategory]      // list of items categories that are relevant to this item pocket
    let names: [Name]                   // resource name listed in different languages
}

struct ItemSprites: Codable {
    let default_depiction: String?     // default depiction of this item
}

struct ItemHolderPokemon: Codable {
    let pokemon: PokemonDetails                                 // the pokemon that holds this item
    let version_details: [ItemHolderPokemonVersionDetail]       // the details for the version that this item is held in by the pokemon
}

struct ItemHolderPokemonVersionDetail: Codable {
    let rarity: Int         // how often this pokemon holds this item in this version
    let version: Version    // version that this item is held by the pokemon
}
