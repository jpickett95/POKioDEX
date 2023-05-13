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
    func getPokemon(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=151/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemon func: \(error)")
        }
    }
    
    
    // Retrieves paginated list of 'Pokemon' from PokeAPI
    func getPokemonAPI(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=151/", model: ResourceList.self) { data in
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
    func getPokemonStats(id: Int, completion:@escaping (PokemonStat) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/stat/\(id)/", model: PokemonStat.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonStats func: \(error)")
        }
    }
    
    // Retrieves 'SpecificType' data from PokeAPI
    func getTypeDetails(typeName: String, completion:@escaping (TypeDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/type/\(typeName)/", model: TypeDetails.self) { data in
            completion(data)
        } failure: { error in
            print("getTypeDetails func: \(error)")
        }
    }
    
    // Retrieves 'Ability' data from PokeAPI
    func getPokemonAbilities(id: Int, completion:@escaping (AbilityDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/ability/\(id)/", model: AbilityDetails.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonAbilities func: \(error)")
        }
    }
    
    // Retrieves 'PokemonSpecies' data from PokeAPI
    func getPokemonSpecies(url: String, completion:@escaping (PokemonSpecies) -> ()) {
        Bundle.main.fetchData(url: url, model: PokemonSpecies.self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonSpecies func: \(error)")
        }
    }
    
    // Retrieves 'PokemonSpecies FlavorText' data from PokeAPI
    func getEvolutionChain(url: String, completion:@escaping (EvolutionChain) -> ()) {
        Bundle.main.fetchData(url: url, model: EvolutionChain.self) { data in
            completion(data)
        } failure: { error in
            print("getEvolutionChain func: \(error)")
        }
    }
    
    func getPokemonLocations(url: String, completion:@escaping ([PokemonLocationArea]) -> ()) {
        Bundle.main.fetchData(url: url, model: [PokemonLocationArea].self) { data in
            completion(data)
        } failure: { error in
            print("getPokemonLocations func: \(error)")
        }
    }
    
}
