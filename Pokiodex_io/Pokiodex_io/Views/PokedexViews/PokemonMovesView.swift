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
                // Moves learned by leveling up
                Section("Level-Up Moves") {
                    let levelMoves = vm.getMovesLists().level
                    
                    if(levelMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves by leveling up...")
                    }
                    
                    ForEach(levelMoves) { move in
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
                
                // Moves learned from TMs/HMs (machine items)
                Section("TM/HM Moves") {
                    let machineMoves = vm.getMovesLists().machine
                    
                    if(machineMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves through items like TMs or HMs...")
                    }
                    
                    ForEach(machineMoves) { move in
                        Text("Name: \(move.move.name ?? "N/A")\nMethod: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")\n")
                    }
                }
                
                // Moves learned through being hatched from an egg
                Section("Egg Moves") {
                    let eggMoves = vm.getMovesLists().egg
                    
                    if(eggMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves by being hatched from an egg...")
                    }
                    
                    ForEach(eggMoves) { move in
                        Text("Name: \(move.move.name ?? "N/A")\nMethod: \(move.version_group_details.first?.move_learn_method.name ?? "N/A")\n")
                    }
                }
                
                // Moves learned from a Pokemon Move Tutor
                Section("Tutor Moves") {
                    let tutorMoves = vm.getMovesLists().tutor
                    
                    if(tutorMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves from a move tutor...")
                    }
                    
                    ForEach(tutorMoves) { move in
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
