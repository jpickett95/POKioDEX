//
//  TypeMatchupsManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

class TypeMatchupsManager {
    
    // Gets JSON data from PokeAPI and populates 'TypeDetails' object
    func getTypeDetails(typeName: String, completion:@escaping (TypeDetails) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/type/\(typeName.lowercased())/", model: TypeDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\n(TypeMatchupManager class) getTypeDetails func: \(error)\n")
        }
    }
    
}
