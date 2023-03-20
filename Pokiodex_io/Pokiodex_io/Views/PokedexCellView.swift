//
//  PokedexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokedexCellView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            HStack {
                VStack (alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Text("Poison")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay (
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                                
                        )
                        
                        .frame(width: 200, height: 14)
                        
                        
                }
                PokemonImageView(vm: vm, pokemon: pokemon)
                    .padding([.bottom, .trailing, .top], 8)
            }
            
        }
        .background(Color.green)
        .cornerRadius(12)
    }
}

struct PokedexCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCellView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
