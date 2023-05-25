//
//  PokemonLocationsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonLocationsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Result
    
    var body: some View {
            List{
                let locations = vm.pokemonLocations ?? [PokemonLocationArea]()
                
                if(locations.isEmpty == true) {
                    Text("There are no locations where this pokemon can be found... \nPerhaps you can find an earlier evolution of this pokemon in the wild.")
                }
                
                ForEach(locations){ location in
                    let details = location.versionDetails
                    let areaName = location.locationArea.name
                    
                    Section(areaName.replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: "area", with: "").capitalized) {
                        ForEach(details) { detail in
                            VStack(alignment: .leading){
                                
                                HStack {
                                    Text("**Method**: \(detail.encounterDetails.first?.method.name.capitalized.replacingOccurrences(of: "-", with: " ") ?? "")")
                                    Spacer()
                                    Text("**\(detail.encounterDetails.first?.chance ?? 0)%**")  // Chance to find by method
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
                                                Image(systemName: "sun.max.fill").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "time-morning" {
                                                Image(systemName: "sunrise.fill").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "time-night" {
                                                Image(systemName: "moon.stars.fill").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "time-evening" {
                                                Image(systemName: "sunset.fill").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "swarm-yes"{
                                                Image(systemName: "ant.fill").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "radio-off"{
                                                Image(systemName: "antenna.radiowaves.left.and.right.slash").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "swarm-no" {
                                                // Do Nothing
                                            } else if condition.name == "radar-on"{
                                                Image(systemName: "wifi").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
                                            } else if condition.name == "radar-off"{
                                                Image(systemName: "wifi.slash").foregroundColor(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")"))
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
                .background(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50))
                //.onAppear{}
        
    }
}

struct PokemonLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLocationsView(vm: PokemonViewModel(), pokemon: Result.sample)
    }
}
