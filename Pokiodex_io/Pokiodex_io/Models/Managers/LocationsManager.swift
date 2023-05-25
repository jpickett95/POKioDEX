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
    
    // Retrieves Detailed Information on Location
    func getDetails(url: String, completion:@escaping (LocationDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: LocationDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\n(LocationsManager class) getDetails func: \(error)\n")
        }
    }
    
    // Retrieves Detailed Information on Location Area
    func getAreaDetails(url: String, completion:@escaping (LocationArea) -> ()) {
        Bundle.main.fetchData(url: url, model: LocationArea.self) { data in
            completion(data)
        } failure: { error in
            print("\n(LocationsManager class) getAreaDetails func: \(error)\n")
        }
    }
}
