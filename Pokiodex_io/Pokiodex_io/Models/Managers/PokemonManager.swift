//
//  PokemonManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//
// https://pokeapi.co/api/v2/pokemon?limit=151 - api endpoint for first 151 pokemon
// Pokemon details url: "https://pokeapi.co/api/v2/pokemon/\(id#)/"
// https://pokeapi.co/api/v2/move?limit=9999/ - api endpoint for all moves

import Foundation

class PokemonManager{
    
    // Retrieves list of 'Pokemon' from internal .json
    func getPokemon() -> [Pokemon] {
        let data: PokemonList = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    // Retrieves paginated list of 'Pokemon' from PokeAPI
    func getPokemonAPI(completion:@escaping (PokemonList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=151/", model: PokemonList.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonAPI func: \(error)")
        }
    }
    
    // Retrieves 'PokemonDetails' struct from PokeAPI
    func getDetailedPokemon(id: Int, completion:@escaping (PokemonDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetails.self) { data in
            completion(data)
        } failure: { error in
            print("getDetailedPokemon func: \(error)")
        }
    }
    
    // Retrieves 'SpecificStat' data from PokeAPI
    func getPokemonStats(id: Int, completion:@escaping (SpecificStat) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: SpecificStat.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonStats func: \(error)")
        }
    }
    
    // Retrieves 'SpecificType' data from PokeAPI
    func getPokemonTypes(id: Int, completion:@escaping (SpecificType) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: SpecificType.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonTypes func: \(error)")
        }
    }
    
    // Retrieves 'Ability' data from PokeAPI
    func getPokemonAbilities(id: Int, completion:@escaping (Ability) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: Ability.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonAbilities func: \(error)")
        }
    }
    
    func getDetailsObject() {
        
    }
}
