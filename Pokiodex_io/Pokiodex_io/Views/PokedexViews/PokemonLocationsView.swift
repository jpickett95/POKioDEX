//
//  PokemonLocationsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonLocationsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ZStack{
            //Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50)
            
            List{
                Section("") {
                    
                }
            }.background(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50))
        }
    }
}

struct PokemonLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLocationsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
