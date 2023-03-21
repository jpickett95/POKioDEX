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
                Text("**Type**: \(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "")")
                
                // Check if pokemon has more than one type
                let typeCount = (vm.pokemonDetails?.types.count) ?? 1
                if(typeCount > 1){
                    Text("**Type 2**: \(vm.pokemonDetails?.types.last?.type.name.capitalized ?? "")")
                }
                
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
