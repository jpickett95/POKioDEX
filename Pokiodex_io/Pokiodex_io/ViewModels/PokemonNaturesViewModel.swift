//
//  PokemonNaturesViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation

final class NaturesViewModel: ObservableObject {
    private let manager = NaturesManager()
    @Published var searchText = ""
    @Published var naturesList = [Result]()
    /*@Published*/ var natureDetails: PokemonNature?
    
    // Filtered list of 'Natures' for searchbar
    var filteredNatures: [Result] {
        return searchText == "" ? naturesList : naturesList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.naturesList
    init() {
        DispatchQueue.global().async {
            self.manager.getNatures() { data in
                DispatchQueue.main.async {
                    self.naturesList = data.results
                    //print(self.naturesList)
                }
            }
        }
    }
    
    // Gets Pokemon Nature details from API
    func getNatureDetails(url: String) {
        DispatchQueue.global().async {
            self.manager.getNatureDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.natureDetails = data
                    //print(self.natureDetails)
                    //print(data)
                }
            }
        }
    }
    
    // Switches API full stat name, and returns an abbreviation
    func switchStatName(stat: String) -> String {
        switch(stat){
        case "hp":
            return "HP  "
        case "attack":
            return "ATK  "
        case "defense":
            return "DEF  "
        case "speed":
            return"SPD  "
        case "special-attack":
            return "SpATK"
        case "special-defense":
            return "SpDEF"
        default:
            return "N/A"
        }
    }
}
