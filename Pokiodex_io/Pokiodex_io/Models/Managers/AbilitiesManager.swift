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
            print("\n(AbilitiesManager class) getAbilities func: \(error)\n")
        }
    }
    
    // Retrieves Detailed Information on Ability
    func getDetails(url: String, completion:@escaping (AbilityDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: AbilityDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\n(AbilitiesManager class) getDetails func: \(error)\n")
        }
    }
}
