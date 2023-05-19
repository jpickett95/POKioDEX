//
//  AbilitiesViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import Foundation
import SwiftUI

final class AbilitiesViewModel: ObservableObject {
    private let manager = AbilitiesManager()
    @Published var searchText = ""
    @Published var abilitiesList = [Result]()
    @Published var abilityDetails: AbilityDetails?
    
    // Filtered list of 'Abilities' for searchbar
    var filteredAbilities: [Result] {
        return searchText == "" ? abilitiesList : abilitiesList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.abilitiesList
    init() {
        DispatchQueue.global().async {
            self.manager.getAbilities() { data in
                DispatchQueue.main.async {
                    self.abilitiesList = data.results
                    //print(self.abilitiesList)
                }
            }
        }
    }
    
    func getDetails(url: String) {
        DispatchQueue.global().async {
            self.manager.getDetails(url: url) { data in
                DispatchQueue.main.async {
                    self.abilityDetails = data
                    //print(self.abilityDetails)
                    //print(data)
                }
            }
        }
    }
    
    func filterFlavorTextLanguage(language: String) -> String {
        var textStrings = [String]()
        let flavorTexts = self.abilityDetails?.flavorTextEntries ?? [FlavorTextEntry]()
        
        for flavorText in flavorTexts {
            if flavorText.language?.name == language {
                textStrings.append(flavorText.flavorText ?? "N/A")
            }
        }
        
        return textStrings.last ?? "N/A"
    }
    
    func parseID(url: String) -> String {
        var urlSrting = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        urlSrting = urlSrting.replacingOccurrences(of: "/", with: "")
        return urlSrting
    }
}
