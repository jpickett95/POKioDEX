//
//  MachineManager.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import Foundation

class MachineManager {
    
    // Retrieves list of 'Machines'
    func getMachines(completion:@escaping (MachineResourceList) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/machine?limit=100/", model: MachineResourceList.self) { data in
            completion(data)
        } failure: { error in
            print("\n(MachineManager class) getMachines func: \(error)\n")
        }
    }
    
    // Retrieves 'MachineDetails' from PokeAPI
    func getMachineDetails(url: String, completion:@escaping (MachineDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: MachineDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\ngetMachineDetails func: \(error)\n")
        }
    }
    
    // Retrieves 'MoveDetails' from PokeAPI
    func getMoveDetails(url: String, completion:@escaping (MoveDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: MoveDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\nMachineManager:\ngetMoveDetails func: \(error)\n")
        }
    }
    
    // Retrieves 'MachineItemDetails' from PokeAPI
    func getItemDetails(url: String, completion:@escaping (ItemDetails) -> ()) {
        Bundle.main.fetchData(url: url, model: ItemDetails.self) { data in
            completion(data)
        } failure: { error in
            print("\nMachineManager:\ngetItemDetails func: \(error)\n")
        }
    }
}
