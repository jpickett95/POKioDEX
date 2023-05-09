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
                
                ForEach(locations){ location in
                    let details = location.version_details ?? [VersionEncounterDetail]()
                    let areaName = location.location_area?.name ?? ""
                    Section(areaName) {
                        ForEach(details) { detail in
                            VStack(alignment: .leading){
                                Text("Method found name: \(detail.encounter_details?.first?.method?.name ?? "")")
                                Text("Chance to find: \(detail.max_chance ?? 0)%")
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
