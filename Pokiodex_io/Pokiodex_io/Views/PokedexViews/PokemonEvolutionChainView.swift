//
//  PokemonEvolutionChainView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonEvolutionChainView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Result
    
    var body: some View {
        ScrollView{
            ZStack{
                Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50)
                VStack(spacing: 15){
                    Text(vm.evolutionChain?.chain.species.name.capitalized ?? "")
                    AsyncImage(url: URL(string:                 "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(vm.parseID(url: vm.evolutionChain?.chain.species.url ?? "")).png"), scale: 4)
                    
                    ForEach(vm.evolutionChain?.chain.evolvesTo ?? [Chain]()) { chainLink in
                        Text("Level: \(chainLink.evolutionDetails.first?.minLevel ?? 0)")
                        Image(systemName: "arrow.down")
                        Text(chainLink.species.name.capitalized)
                        AsyncImage(url: URL(string:                 "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(vm.parseID(url: chainLink.species.url)).png"), scale: 4)
                        
                        ForEach(chainLink.evolvesTo ) { chainLink in
                            Text("Level: \(chainLink.evolutionDetails.first?.minLevel ?? 0)")
                            Image(systemName: "arrow.down")
                            Text(chainLink.species.name.capitalized)
                            AsyncImage(url: URL(string:                 "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(vm.parseID(url: chainLink.species.url)).png"), scale: 4)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct PokemonEvolutionChainView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonEvolutionChainView(vm: PokemonViewModel(), pokemon: Result.sample)
    }
}
