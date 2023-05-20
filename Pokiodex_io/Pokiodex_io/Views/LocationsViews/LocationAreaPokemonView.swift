//
//  LocationAreaPokemonView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/20/23.
//

import SwiftUI

struct LocationAreaPokemonView: View {
    @ObservedObject var vm: LocationsViewModel
    let area: URLObject
    
    var body: some View {
        
        List{
            Text("Pokemon Encounters").font(.title2).bold()
            let pokemonEncounters = vm.areaDetails?.pokemonEncounters ?? [PokemonEncounter]()
            
            if(pokemonEncounters.isEmpty == true) {
                Text("There are no pokemon found in this area...")
            }
            
            ForEach(pokemonEncounters){ encounter in
                let details = encounter.versionDetails
                let pokemon = encounter.pokemon
                Section{
                    HStack{
                        Text(pokemon.name.replacingOccurrences(of: "-", with: " ").capitalized).font(.title2).bold()
                        Spacer()
                        let id  = vm.parseID(url: pokemon.url)
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"))
                    }
                    
                    ForEach(details) { detail in
                        VStack(alignment: .leading){
                            
                            Text("**Method Found**: \(detail.encounterDetails.first?.method.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "")")
                            //Text("Method Names found name: \(detail.encounterDetails.first?.method.name ?? "")")
                            Text("**Chance to Find**: \(detail.encounterDetails.first?.chance ?? 0)%")
                            HStack{
                                Text("**Min Lvl**: \(detail.encounterDetails.first?.minLevel ?? 0)")
                                Spacer()
                                Text("**Max Lvl**: \(detail.encounterDetails.first?.maxLevel ?? 0)")
                            }
                            //Text("Condition Value name: \(detail.encounterDetails.first?.conditionValues.first?.name ?? "")")
                            ///Text("Condition name: \(detail.encounterDetails.first?.conditionValues.first?.name ?? "")")
                        }
                    }
                    
                }
            }
            
        }.scrollContentBackground(.hidden)
            .background(Color.blue.opacity(0.25))
            .onAppear{vm.getAreaDetails(url: area.url)}
            .navigationTitle(area.name.replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: "area", with: "").capitalized)
    }
}

struct LocationAreaPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAreaPokemonView(vm: LocationsViewModel(), area: URLObject(name: "canalave-city-area", url: "https://pokeapi.co/api/v2/location-area/1/"))
    }
}
