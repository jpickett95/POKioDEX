//
//  AbilitiesManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

class AbilitiesManager {
    
    // Retrieves list of 'Abilities'
    func getAbilities(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/ability?limit=500/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("\n(Ability Manager class) getAbilities func: \(error)\n")
        }
    }
}
