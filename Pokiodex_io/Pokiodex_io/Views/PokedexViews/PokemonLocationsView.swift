//
//  PokemonLocationsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonLocationsView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        
            
            List{
                let locations = vm.pokemonLocations ?? [LocationAreaEncounter]()
                
                if(locations.isEmpty == true) {
                    Text("There are no locations where this pokemon can be found... \nPerhaps you can find an earlier evolution of this pokemon in the wild.")
                }
                
                ForEach(locations){ location in
                    let details = location.version_details ?? [VersionEncounterDetail]()
                    let areaName = location.location_area?.name ?? ""
                    Section(areaName) {
                        ForEach(details) { detail in
                            VStack(alignment: .leading){
                                Text("Method found name: \(detail.encounter_details?.first?.method?.name ?? "")")
                                Text("Method Names found name: \(detail.encounter_details?.first?.method?.names?.first?.name ?? "")")
                                Text("Chance to find: \(detail.encounter_details?.first?.chance ?? 0)%")
                                Text("Max level to find: \(detail.encounter_details?.first?.max_level ?? 0)")
                                Text("Min level to find: \(detail.encounter_details?.first?.min_level ?? 0)")
                                Text("Condition Value name: \(detail.encounter_details?.first?.condition_values?.first?.name ?? "")")
                                Text("Condition name: \(detail.encounter_details?.first?.condition_values?.first?.condition?.name ?? "")")
                            }
                        }
                        
                    }
                }
                
            }.scrollContentBackground(.hidden)
                .background(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50))
                .onAppear{vm.getPokemonLocations()}
        
    }
}

struct PokemonLocationsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLocationsView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
