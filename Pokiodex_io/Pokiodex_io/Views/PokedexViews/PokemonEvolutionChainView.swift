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
            VStack{
                Text("Resistances & Weaknesses")   // Title
                    .font(.title2).bold()
                
                let typeRelations = vm.returnTypeRelations(typeName: vm.pokemonDetails?.types.first?.type.name ?? "")
                Text("No damage to: ")
                ForEach(typeRelations.no_damage_to ?? [SpecificType]()) { type in
                    Text(type.name)
                }
            }
        }
    }
}

struct PokemonEvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionChainView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
