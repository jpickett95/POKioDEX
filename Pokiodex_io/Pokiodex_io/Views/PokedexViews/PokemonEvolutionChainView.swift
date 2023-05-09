//
//  PokemonEvolutionChainView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonEvolutionChainView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ZStack{
            Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50)
        }
    }
}

struct PokemonEvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionChainView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
