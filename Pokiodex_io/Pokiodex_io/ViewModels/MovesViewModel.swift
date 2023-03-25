//
//  MovesViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/21/23.
//

import Foundation
import SwiftUI

final class MovesViewModel: ObservableObject {
    private let moveManager = MoveManager()
    
    @Published var movesList = [PokemonMove]()
    @Published var moveDetails: MoveDetails?
    @Published var searchText = ""
    
    var filteredMoves: [PokemonMove] {
        return searchText == "" ? movesList : movesList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.movesList = moveManager.getMoves()
        //print(self.movesList)
    }
    
    func getMoveID(move: PokemonMove) -> Int {
        if let id = self.movesList.firstIndex(of: move) {
            if id >= 901 {
                return id + 9100
            } else { return id + 1 }
        }
        return 0
    }
    
    func getDetails(move: PokemonMove) {
        let id = getMoveID(move: move)
        
        //self.moveDetails = MoveDetails(id: 0, name: "", accuracy: 0, effect_chance: 0, pp: 0, priority: 0, power: 0, learned_by_pokemon: [Pokemon]()) //- not necessary since decoded in struct initializer
        
        moveManager.getMoveDetails(id: id) { data in
            DispatchQueue.main.async {
                self.moveDetails = data
            }
        }
        //print(self.$moveDetails)
    }
}
