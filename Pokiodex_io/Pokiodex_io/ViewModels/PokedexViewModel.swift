//
//  PokedexViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/12/23.
//

import Foundation
import SwiftUI

final class PokedexViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    @Published var pokemonList = [Result]()
    @Published var pokemonDetails: Pokemon?
    @Published var searchText = ""
    
    // Filtered pokemonList for searchbar
    var filteredPokemon: [Result] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer which populates pokemonList with 'Pokemon' from PokeAPI
    init() {
        DispatchQueue.global().async {
            self.pokemonManager.getPokemon() { data in
                DispatchQueue.main.async {
                    self.pokemonList = data.results
                    print(self.pokemonList)
                }
            }
        }
    }
    
    func getPokemonID(pokemon: Result) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) {
            return id + 1
        }
        return 0
    }
    
    
    // Uses manager to populate self.pokemonDetails with 'PokemonDetails' from PokeAPI
    func getDetails(pokemon: Result) {
        let id = getPokemonID(pokemon: pokemon) // get id#
        DispatchQueue.global().async {
            // get 'PokemonDetails'
            self.pokemonManager.getDetailedPokemon(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemon = data
                    //print(self.pokemonDetails)
                }
            }
        }
    }
}
