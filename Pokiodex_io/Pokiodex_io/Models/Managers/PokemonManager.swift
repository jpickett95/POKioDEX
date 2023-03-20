//
//  PokemonManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//
// https://pokeapi.co/api/v2/pokemon?limit=151 - api endpoint for first 151 pokemon
// Pokemon details url: "https://pokeapi.co/api/v2/pokemon/\(id#)/"

import Foundation

class PokemonManager{
    func getPokemon() -> [Pokemon] {
        let data: PokemonList = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, completion:@escaping (PokemonDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetails.self) { data in
            completion(data)
        } failure: { error in
            print(error) 
        }
    }
}
