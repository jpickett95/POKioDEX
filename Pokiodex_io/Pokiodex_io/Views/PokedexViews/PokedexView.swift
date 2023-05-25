//
//  PokedexView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var vm = PokemonViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(vm.filteredPokemon) { pokemon in
                    
                    NavigationLink(destination: PokedexTabView(vm: vm, pokemon: pokemon)) {
                        PokedexCellView(vm: vm, pokemon: pokemon)
                    }
                    
                }
            }
        }
        .searchable(text: $vm.searchText)
        .navigationTitle("Pokedex")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            PokedexView()
        }
    }
}
