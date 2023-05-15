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
    
    // Filtered list of 'Natures' for searchbar
    var filteredItems: [Result] {
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
}
