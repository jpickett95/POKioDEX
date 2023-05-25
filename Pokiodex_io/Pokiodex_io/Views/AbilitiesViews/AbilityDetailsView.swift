//
//  AbilityDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/15/23.
//

import SwiftUI

struct AbilityDetailsView: View {
    @ObservedObject var vm: AbilitiesViewModel
    let ability: Result
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Ability Effect").font(.title2).bold() // Effect Title
                Text(vm.filterFlavorTextLanguage(language: "en"))
                
                Spacer()
                Divider()
                    .scaleEffect(10)
                
                Text("Pokemon with \"\(ability.name.capitalized.replacingOccurrences(of: "-", with: " "))\"").font(.title2).bold()  // Pokemon with Ability Title
                
                // Icon Key
                Label("- Indicates a hidden ability.", systemImage: "eye.fill").font(.caption)
                
                // Pokemon List
                let pokemonList = vm.abilityDetails?.pokemon ?? [Pokemon]()
                ForEach(pokemonList) { pokemon in
                    HStack{
                        Text(pokemon.pokemon.name.capitalized.replacingOccurrences(of: "-", with: " ")).foregroundColor(Color.white).bold()
                        if pokemon.isHidden == true {
                            Image(systemName: "eye.fill").foregroundColor(Color.white)
                        }
                        let id  = vm.parseID(url: pokemon.pokemon.url)
                        Spacer()
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"))
                    }
                    .padding(20)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.purple.opacity(0.5)))
                }
            }
        }.onAppear{vm.getDetails(url: ability.url)}
            .padding(20)
    }
}

struct AbilityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityDetailsView(vm: AbilitiesViewModel(), ability: Result.sample)
    }
}
