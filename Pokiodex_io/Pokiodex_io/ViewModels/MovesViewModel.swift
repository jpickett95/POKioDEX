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
    @Published var movesList = [Result]()
    @Published var moveDetails: MoveDetails?
    @Published var searchText = ""
    
    // Filtered list of 'PokemonMove's for searchbar
    var filteredMoves: [Result] {
        return searchText == "" ? movesList : movesList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer to populate self.movesList
    init() {
        DispatchQueue.global().async {
            self.moveManager.getMoves() { data in
                DispatchQueue.main.async {
                    self.movesList = data.results
                    //print(self.movesList)
                }
            }
        }
    }
    
    // Returns id# of 'PokemonMove' input
    func getMoveID(move: Result) -> Int {
        if let id = self.movesList.firstIndex(of: move) {
            if id >= 901 {
                return id + 9100
            } else { return id + 1 }
        }
        return 0
    }
    
    func getDetails(move: Result) {
        let id = getMoveID(move: move)  // get id#
        
        DispatchQueue.global().async {
            // get 'MoveDetails'
            self.moveManager.getMoveDetails(id: id) { data in
                DispatchQueue.main.async {
                    self.moveDetails = data
                    //print(self.moveDetails)
                }
            }
        }
    }
    
    func parseID(url: String) -> String {
        var urlSrting = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        urlSrting = urlSrting.replacingOccurrences(of: "/", with: "")
        return urlSrting
    }
}
