//
//  ItemsManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

class ItemsManager {
    
    // Retrieves list of 'Items'
    func getItems(completion:@escaping (ResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/item?limit=500/", model: ResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("\n(ItemsManager class) getItems func: \(error)\n")
        }
    }
    
    // Retrieves Detailed Information on Game Object
    func getDetails(url: String, completion:@escaping (ItemDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: ItemDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\n(ItemsManager class) getDetails func: \(error)\n")
        }
    }
}
