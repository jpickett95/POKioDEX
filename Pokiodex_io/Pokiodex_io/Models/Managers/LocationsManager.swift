//
//  LocationsManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

class LocationsManager {
    
    // Retrieves list of 'Locations'
    func getLocations(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/location?limit=500/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("\n(LocationsManager class) getLocations func: \(error)\n")
        }
    }
}
