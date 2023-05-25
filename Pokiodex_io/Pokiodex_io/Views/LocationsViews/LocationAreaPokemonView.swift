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
            
            // Potential Pokemon Found
            ForEach(pokemonEncounters){ encounter in
                let details = encounter.versionDetails
                let pokemon = encounter.pokemon
                Section{
                    // Name & Image
                    HStack{
                        Text(pokemon.name.replacingOccurrences(of: "-", with: " ").capitalized).font(.title2).bold()
                        Spacer()
                        let id  = vm.parseID(url: pokemon.url)
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"))
                    }
                    
                    // Encounter Details
                    ForEach(details) { detail in
                        VStack(alignment: .leading){
                            HStack{
                                Text("**Method**: \(detail.encounterDetails.first?.method.name.replacingOccurrences(of: "-", with: " ").capitalized ?? "")")
                                Spacer()
                                Text("**\(detail.encounterDetails.first?.chance ?? 0)%**")
                            }
                            
                            HStack{
                                Text("**Min Lvl**: \(detail.encounterDetails.first?.minLevel ?? 0)")
                                Spacer()
                                Text("**Max Lvl**: \(detail.encounterDetails.first?.maxLevel ?? 0)")
                            }
                            
                            //Conditions
                            if !((detail.encounterDetails.first?.conditionValues ?? [URLObject]()).isEmpty) {
                                Text("**Conditions:**")
                                HStack{
                                    
                                    // Display Icon depending on condition
                                    ForEach(detail.encounterDetails.first?.conditionValues ?? [URLObject]()) { condition in
                                        if condition.name == "time-day" {
                                            Image(systemName: "sun.max.fill")
                                        } else if condition.name == "time-morning" {
                                            Image(systemName: "sunrise.fill")
                                        } else if condition.name == "time-night" {
                                            Image(systemName: "moon.stars.fill")
                                        } else if condition.name == "time-evening" {
                                            Image(systemName: "sunset.fill")
                                        } else if condition.name == "swarm-yes"{
                                            Image(systemName: "ant.fill")
                                        } else if condition.name == "radio-off"{
                                            Image(systemName: "antenna.radiowaves.left.and.right.slash")
                                        } else if condition.name == "swarm-no" {
                                            // Do Nothing
                                        } else if condition.name == "radar-on"{
                                            Image(systemName: "wifi")
                                        } else if condition.name == "radar-off"{
                                            Image(systemName: "wifi.slash")
                                        } else {
                                            Text(condition.name)
                                        }
                                    }
                                }
                            }
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
