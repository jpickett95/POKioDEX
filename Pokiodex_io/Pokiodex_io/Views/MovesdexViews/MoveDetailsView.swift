//
//  MoveDetailsView.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/22/23.
//

import SwiftUI

struct MoveDetailsView: View {
    @ObservedObject var vm: MovesViewModel
    let move: PokemonMove
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("**Name**: \(move.name.capitalized)")
                Text("**ID**: \(vm.getMoveID(move: move))")
                Text("**Accuracy**: \(vm.moveDetails?.accuracy ?? 0)")
                Text("**Effect Chance**: \(vm.moveDetails?.effect_chance ?? 0)")
                Text("**PP**: \(vm.moveDetails?.pp ?? 0)")
                Text("**Prioirty**: \(vm.moveDetails?.priority ?? 0)")
                Text("**Power**: \(vm.moveDetails?.power ?? 0)")
            }
            
        }
        .onAppear{vm.getDetails(move: move)}
        .navigationTitle("\(move.name.capitalized) Details")
    }
}

struct MoveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MoveDetailsView(vm: MovesViewModel(), move: PokemonMove.sample)
    }
}
