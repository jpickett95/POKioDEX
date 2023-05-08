//
//  PokedexTabView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/5/23.
//

import SwiftUI

struct PokedexTabView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        TabView {
            PokemonDetailsView(vm: vm, pokemon: pokemon)
                .tabItem {
                    Label {
                        Text("Details")
                    } icon: {
                        Image(systemName: "person.text.rectangle.fill")
                    }
                }
            
            PokemonEvolutionChainView(vm: vm, pokemon: pokemon)
                .tabItem {
                    Label {
                        Text("Evolution")
                    } icon: {
                        Image(systemName: "link.circle.fill")
                    }
                }
            
            PokemonMovesView(vm: vm, pokemon: pokemon)
                .tabItem {
                    Label {
                        Text("Moves")
                    } icon: {
                        Image(systemName: "opticaldisc.fill")
                    }
                }
            
            PokemonLocationsView(vm: vm, pokemon: pokemon)
                .tabItem {
                    Label {
                        Text("Locations")
                    } icon: {
                        Image(systemName: "mappin.and.ellipse")
                    }
                }
        }.accentColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
    }
}

struct PokedexTabView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexTabView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
