//
//  PokemonMovesView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 5/8/23.
//

import SwiftUI

struct PokemonMovesView: View {
    @ObservedObject var vm: PokemonViewModel
    let pokemon: Result
    
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
                            Text(move.move.name.capitalized.replacingOccurrences(of: "-", with: " ")).bold()
                            Text("Level: \(move.versionGroupDetails.first?.levelLearnedAt ?? 0)")
//                            ForEach(move.versionGroupDetails) { detail in
//                                Text("Game: \(detail.versionGroup.name.replacingOccurrences(of: "-", with: " ").capitalized)")
//                                Text("Level: \(detail.levelLearnedAt)")
//
//                            }
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
                        Text(move.move.name.replacingOccurrences(of: "-", with: " ").capitalized)
                    }
                }
                
                // Moves learned through being hatched from an egg
                Section("Egg Moves") {
                    let eggMoves = vm.getMovesLists().egg
                    
                    if(eggMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves by being hatched from an egg...")
                    }
                    
                    ForEach(eggMoves) { move in
                        Text(move.move.name.replacingOccurrences(of: "-", with: " ").capitalized)
                    }
                }
                
                // Moves learned from a Pokemon Move Tutor
                Section("Tutor Moves") {
                    let tutorMoves = vm.getMovesLists().tutor
                    
                    if(tutorMoves.isEmpty == true){
                        Text("This pokemon cannot learn moves from a move tutor...")
                    }
                    
                    ForEach(tutorMoves) { move in
                        Text(move.move.name.replacingOccurrences(of: "-", with: " ").capitalized)
                    }
                }
            }.scrollContentBackground(.hidden)
            .background(Color("Type_\(vm.pokemonDetails?.types.first?.type.name.capitalized ?? "Normal")").opacity(0.50))
    }
}

struct PokemonMovesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMovesView(vm: PokemonViewModel(), pokemon: Result.sample)
    }
}
