//
//  MovesLearnedByView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/10/23.
//

import SwiftUI

struct MovesLearnedByView: View {
    @ObservedObject var vm: MovesViewModel
    let move: Result
    
    var body: some View {
        List {
            let learnedBy = vm.moveDetails?.learnedByPokemon ?? [URLObject]()
            ForEach(learnedBy) { pokemon in
                HStack{
                    Text("\(pokemon.name.replacingOccurrences(of: "-", with: " ").capitalized)")
                    
                    let id  = vm.parseID(url: pokemon.url)
                    Spacer()
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"))
                }
            }
        }
    }
}

struct MovesLearnedByView_Previews: PreviewProvider {
    static var previews: some View {
        MovesLearnedByView(vm: MovesViewModel(), move: Result.sample)
    }
}
