//
//  PokemonMovesView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonMovesView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
            List{
                Section("Level-Up Moves") {
                    ForEach(vm.getMovesLists().level) { move in
                        VStack{
                            Text("Name: \(move.move.name ?? "N/A")")
                            Text("Method: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")")
                            Text("Level: \(move.version_group_details.first?.level_learned_at ?? 0)")
                            Text("PP: \(move.move.pp ?? 0)")
                            Text("Power: \(move.move.power ?? 0)")
                            Text("Accuracy: \(move.move.accuracy ?? 0)")
                            Text("Priority: \(move.move.priority ?? 0)")
                            Text("Effect Chance: \(move.move.effect_chance ?? 0)")
                        }
                    }
                }
                
                Section("TM/HM Moves") {
                    ForEach(vm.getMovesLists().machine) { move in
                        Text("Name: \(move.move.name ?? "N/A")\nMethod: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")\n")
                    }
                }
                
                Section("Egg Moves") {
                    ForEach(vm.getMovesLists().egg) { move in
                        Text("Name: \(move.move.name ?? "N/A")\nMethod: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")\n")
                    }
                }
                
                Section("Tutor Moves") {
                    ForEach(vm.getMovesLists().tutor) { move in
                        Text("Name: \(move.move.name ?? "N/A")\nMethod: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")\n")
                    }
                }
            }.scrollContentBackground(.hidden)
            .background(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50))
    }
}

struct PokemonMovesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMovesView(vm: PokemonViewModel(), pokemon: Pokemon.samplePokemon)
    }
}
