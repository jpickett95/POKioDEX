//
//  PokemonViewModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/20/23.
//

import Foundation
import SwiftUI

final class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetails?
    @Published var pokemonStats: SpecificStat?
    @Published var pokemonTypes: SpecificType?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        //print(self.pokemonList)
    }
    
    func getPokemonID(pokemon: Pokemon) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) {
            return id + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonID(pokemon: pokemon)
        
        self.pokemonDetails = PokemonDetails(id: 0, height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "", url: ""))], types: [PokemonTypes(slot: 0, type: SpecificType(name: "", url: ""))])
        self.pokemonStats = SpecificStat(name: "", url: "")
        self.pokemonTypes = SpecificType(name: "", url: "")
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
        
        pokemonManager.getPokemonStats(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonStats = data
            }
        }
        
        pokemonManager.getPokemonTypes(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonTypes = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    } 
    
    func switchType(type: SpecificType) -> String {
        let typeString = type.name.uppercased()
        switch typeString {
        case "WATER":
            return "water"
        case "GRASS":
            return "grass"
        case "FIRE":
            return "fire"
        case "ROCK":
            return "rock"
        case "GROUND":
            return "ground"
        case "STEEL":
            return "steel"
        case "BUG":
            return "bug"
        case "PSYCHIC":
            return "psychic"
        case "DARK":
            return "dark"
        case "FIGHTING":
            return "fighting"
        case "ICE":
            return "ice"
        case "DRAGON":
            return "dragon"
        case "FAIRY":
            return "fairy"
        case "FLYING":
            return "flying"
        case "ELECTRIC":
            return "electric"
        case "GHOST":
            return "ghost"
        case "NORMAL":
            return "normal"
        default:
            return ""
        }
    }
}
