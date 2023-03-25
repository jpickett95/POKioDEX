//
//  EvolutionModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct EvolutionChain: Codable {
    let id: Int                     // identifier
    let baby_trigger_item: Item     // the item that a pokemon would be holding when mating that would trigger the egg hatching a bay pokemon rather than a basic pokemon
    let chain: ChainLink            // the base chain link object. Each link contains evolution details for a pokemon in the chain. Each link references the next pokemon in teh natural evolution order
}

struct ChainLink: Codable {
    let is_baby: Bool                           // whether or not this link is for a baby pokemon. This would only ever be true on the base link
    let species: PokemonSpecies                 // pokemon species at this point in the evolution chain
    let evolution_details: [EvolutionDetail]    // all details regarding the specific details of the referenced pokemon species evolution
    let evolves_to: [ChainLink]                 // list of chain objects
}

struct EvolutionDetail :Codable {
    let item: Item                              //item required to cause evolution
    let trigger: EvolutionTrigger               // type of event that triggers evolution into this pokemon species
    let gender: Int                             // id of the gender of the evolving pokemon species must be in order to evolve into this pokemon species
    let held_item: Item                         // the item the evolving pokemon species must be holding during the evolution trigger event in order to evolve into this pokemon species
    let known_move: MoveDetails                 // the move that must be known by the evolving pokemon species during the evolution trigger event in order to evolve into this species
    let known_move_type: SpecificType           // the evolving pokemon must know a move of this type during the evolution trigger event in order to evolve into this species
    let location: Location                      // location the evolution must be triggered at
    let min_level: Int                          // minimum level required of the evolving pokemon species to evolve into this species
    let min_happiness: Int                      // minimum required level of happiness of the evolving species to evolve into this species
    let min_beauty: Int                         // minimum required level of beauty of the evolving species in order to evolve into this species
    let min_affection: Int                      // minimum required level of affection of the evolving species to evolve into this species
    let needs_overworld_rain: Bool              // whether or not it must be raining in the overworld to cause evolution to this species
    let party_species: PokemonSpecies           // species that must be in player's party during evolution trigger event in order for evolving species to evolve into this species
    let party_type: SpecificType                // player must have a pokemon of this type in their party during an evolution trigger event in order  for the evolving species to evolve into this species
    let relative_physical_stats: Int            // required relation between the pokemon's attack & defense stats.
                                                        // 1 means Attack > Defense.
                                                        // 0 means Attack = Defense.
                                                        // -1 means Attack < Defense
    let time_of_day: String                     // required time of day. 'day' or 'night'
    let trade_species: PokemonSpecies           // pokemon species for which this one must be traded
    let turn_upside_down: Bool                  // whether or not the 3DS needs to be turned upside-down as this pokemon levels up
}

struct EvolutionTrigger: Codable {
    let id: Int                                 // identifier
    let name: String                            // resource name
    let names: [Name]                           // resource name listed in different languages
    let pokemon_species: [PokemonSpecies]       // list of pokemon species that result from this evolution trigger
}
