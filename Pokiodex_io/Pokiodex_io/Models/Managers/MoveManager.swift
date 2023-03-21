//
//  MoveManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation

class MoveManager {
    func getMoves() -> [PokemonMove] {
        let data: MovesList = Bundle.main.decode(file: "moves.json")
        let moves: [PokemonMove] = data.results
        
        return moves
    }
    
    func getMoveDetails(id: Int, completion:@escaping (MoveDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/move/\(id)/", model: MoveDetails.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
