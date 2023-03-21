//
//  PokedexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokedexCellView: View {
    @ObservedObject var vm: PokemonViewModel
    private let manager = PokemonManager()
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            HStack {
                VStack (alignment: .center, spacing: 30) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    Text("type")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay (
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 200, height: 24)
                }
                .onAppear{vm.getDetails(pokemon: pokemon)}
                PokemonImageView(vm: vm, pokemon: pokemon)
                    .padding([.bottom, .trailing, .top], 10)
                
            }
            
        }
        .background(Color.gray)
        .cornerRadius(12)
        
    }
}

struct PokedexCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCellView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
