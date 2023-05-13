//
//  MoveManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

class MoveManager {
    
    // Retrieves list of 'PokemonMove's from internal .json
    func getMoves(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/move?limit=500/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("getMoves func: \(error)")
        }
    }
    
    // Retrieves 'MoveDetails' from PokeAPI
    func getMoveDetails(id: Int, completion:@escaping (MoveDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/move/\(id)/", model: MoveDetails.self) { data in
            completion(data)
        } failure: { error in
            print("getMoveDetails func: \(error)")
        }
    }
    
   
}
