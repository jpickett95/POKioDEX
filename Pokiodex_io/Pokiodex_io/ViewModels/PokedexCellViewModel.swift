//
//  PokedexCellViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/30/23.
//

import Foundation
import SwiftUI

class PokedexCellViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    @ObservedObject var vm = PokemonViewModel()
    @Published var pokemonDetails: PokemonDetails?
    
    func getDetails(pokemon: Result) {
        let id = vm.getPokemonID(pokemon: pokemon) // get id#
        
        DispatchQueue.global().async {
            // get 'PokemonDetails'
            self.pokemonManager.getDetailedPokemon(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonDetails = data
                    print("CellVM: \(self.pokemonDetails)\n")
                }
            }
        }
    }
}


