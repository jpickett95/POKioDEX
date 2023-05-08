//
//  PokemonImageView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//
// front_default sprite url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id#).png"

import SwiftUI

struct PokemonImageView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    let dimensions: Double
    
    var body: some View {
        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png")) { image in
            
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimensions, height: dimensions)
            
        }placeholder: {
            ProgressView()
                .frame(width: dimensions, height: dimensions)
        }
        .background(.thinMaterial)
        .clipShape(Circle())
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon, dimensions: 140)
    }
}
