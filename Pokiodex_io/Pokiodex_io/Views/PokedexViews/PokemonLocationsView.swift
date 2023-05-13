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
                                Text("Method found name: \(detail.encounterDetails.first?.method.name ?? "")")
                                Text("Method Names found name: \(detail.encounterDetails.first?.method.name ?? "")")
                                Text("Chance to find: \(detail.encounterDetails.first?.chance ?? 0)%")
                                Text("Max level to find: \(detail.encounterDetails.first?.maxLevel ?? 0)")
                                Text("Min level to find: \(detail.encounterDetails.first?.minLevel ?? 0)")
                                Text("Condition Value name: \(detail.encounterDetails.first?.conditionValues.first?.name ?? "")")
                                Text("Condition name: \(detail.encounterDetails.first?.conditionValues.first?.name ?? "")")
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
