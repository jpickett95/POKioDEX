//
//  PokemonDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonImageView(vm:vm, pokemon: pokemon)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("**Name**: \(pokemon.name.capitalized)")
                Text("**No**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
            }
            
        }
        .onAppear{vm.getDetails(pokemon: pokemon)}
        .navigationTitle("\(pokemon.name.capitalized)'s Details")
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
            
    }
}
