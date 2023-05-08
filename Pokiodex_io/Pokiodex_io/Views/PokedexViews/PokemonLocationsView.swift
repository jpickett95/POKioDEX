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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLocationsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
