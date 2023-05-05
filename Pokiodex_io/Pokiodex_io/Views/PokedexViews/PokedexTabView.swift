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
        }
    }
}

struct PokedexTabView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexTabView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
