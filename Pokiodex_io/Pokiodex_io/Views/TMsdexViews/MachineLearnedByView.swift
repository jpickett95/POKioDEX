//
//  MachineLearnedByView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/13/23.
//

import SwiftUI

struct MachineLearnedByView: View {
    @ObservedObject var vm: MachinesViewModel
    let machine: MachineDetails
    
    var body: some View {
        List {
            let learnedBy = vm.moveDetails?.learnedByPokemon ?? [URLObject]()
            ForEach(learnedBy) { pokemon in
                HStack{
                    // Name
                    Text("\((pokemon.name.replacingOccurrences(of: "-", with: " ").capitalized))")
                    
                    // Image
                    let id  = vm.parseID(url: pokemon.url)
                    Spacer()
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"))
                }
            }
        }
    }
}

struct MachineLearnedByView_Previews: PreviewProvider {
    static var previews: some View {
        MachineLearnedByView(vm: MachinesViewModel(), machine: MachineDetails.sample)
    }
}
