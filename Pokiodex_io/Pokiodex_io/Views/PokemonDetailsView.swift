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
            //PokemonImageView()
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
            }
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
            
    }
}
