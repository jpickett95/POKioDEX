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
}
