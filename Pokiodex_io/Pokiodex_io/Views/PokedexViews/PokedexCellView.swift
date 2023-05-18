//
//  PokedexCellView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import SwiftUI

struct PokedexCellView: View {
    @StateObject var vm: PokemonViewModel
    //@StateObject var cellVM = PokedexCellViewModel()
    let pokemon: Result
    
    var body: some View {
        ZStack {
            HStack {
                VStack (alignment: .center, spacing: 20) {
                    // Pokemon Name
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.trailing)
                
                    // Pokemon Type
//                    let type = vm.cellPokemonDetails?.types.first?.type.name ?? "N/A"
//                    Text(type)
//                        .font(.subheadline).bold()
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 8)
//                        .overlay (
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(Color.white.opacity(0.25))
//                        )
//                        .frame(width: 200, height: 24)
                }
                //.onAppear{vm.getCellDetails(pokemon: pokemon)}
                
                Spacer()
                
                PokemonImageView(vm:vm, pokemon: pokemon, dimensions: 75)
                    .padding([.bottom, .trailing, .top], 10)
                
            }
            .padding(20)
            
        }
        
        .frame(width: 350, height: 100)
        .background(Color.gray)
        .cornerRadius(12)
        
    }
}

struct PokedexCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCellView(vm: PokemonViewModel(), pokemon: Result.sample)
    }
}
