//
//  PokemonNatureManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

class NaturesManager{
    
    // Retrieves list of 'Locations'
    func getNatures(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/nature?limit=500/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("\n(NaturesManager class) getNatures func: \(error)\n")
        }
    }
}
