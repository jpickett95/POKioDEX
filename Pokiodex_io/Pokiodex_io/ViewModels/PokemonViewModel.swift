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
    @Published var pokemonList = [Result]()
    @Published var pokemonDetails: PokemonDetails?
    var cellPokemonDetails: PokemonDetails?
    @Published var pokemonTypes: [TypeDetails]?
    @Published var evolutionChain: EvolutionChain?
    @Published var pokemonSpecies: PokemonSpecies?
    @Published var searchText = ""
    @Published var pokemonLocations: [PokemonLocationArea]?
    
    // Filtered pokemonList for searchbar
    var filteredPokemon: [Result] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    // initializer which populates pokemonList with 'Pokemon' from PokeAPI
    init() {
        DispatchQueue.global().async {
            self.pokemonManager.getPokemonAPI() { data in
                DispatchQueue.main.async {
                    self.pokemonList = data.results
                    //print(self.pokemonList)
                }
            }
        }
    }
    
    // Returns Pokedex id# of input 'Pokemon'
    func getPokemonID(pokemon: Result) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) {
            return id + 1
        }
        return 0
    }
    
    // Uses manager to populate self.pokemonDetails with 'PokemonDetails' from PokeAPI
    func getDetails(pokemon: Result) {
        let id = getPokemonID(pokemon: pokemon) // get id#
        
        DispatchQueue.global().async {
            // get 'PokemonDetails'
            self.pokemonManager.getDetailedPokemon(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonDetails = data
                    //print(self.pokemonDetails)
                    
                    self.getSpecies(url: data.species.url)
                    self.getResistances(types: data.types)
                    self.getPokemonLocations(url: data.locationAreaEncounters)
                }
            }
        }
    }
    
    // NOT IN USE
    func getCellDetails(pokemon: Result) {
        let id = getPokemonID(pokemon: pokemon) // get id#
        
        DispatchQueue.global().async {
            self.pokemonManager.getDetailedPokemon(id: id) { data in
                DispatchQueue.main.async {
                    self.cellPokemonDetails = data
                    //print(self.cellPokemonDetails)
                }
            }
        }
    }
    
    // Uses manager to populate self.pokemonSpecies with 'PokemonSpecies' from PokeAPI
    func getSpecies(url: String) {
        DispatchQueue.global().async {
            // get 'PokemonSpecies'
            self.pokemonManager.getPokemonSpecies(url: url) { data in
                DispatchQueue.main.async {
                    self.pokemonSpecies = data
                    //print(self.pokemonSpecies)
                    
                    self.getEvolutionChain(url: data.evolutionChain.url)
                }
            }
        }
    }
    
    func getResistances(types: [TypeElement]) {
        self.pokemonTypes = [TypeDetails]()
        
        DispatchQueue.global().async {
            for type in types {
                self.pokemonManager.getTypeDetails(typeName: type.type.name) { data in
                    DispatchQueue.main.async {
                        self.pokemonTypes?.append(data)
                        //print(data.damageRelations.doubleDamageFrom.first?.name)
                        //print(data.damageRelations)
                    }
                }
            }
        }
    }
    
    func returnDamageRelations() -> ( damageDoubleFrom: [String], damageHalfFrom: [String], noDamageFrom: [String], damageQuadFrom: [String], damageQuarterFrom: [String]) {
        
        var damageDoubleFrom = [String]()
        var damageHalfFrom = [String]()
        var noDamageFrom = [String]()
        var damageQuadFrom = [String]()
        var damageQuarterFrom = [String]()
        
        for type in self.pokemonTypes ?? [TypeDetails]() {
            for typeName in type.damageRelations.doubleDamageFrom {
                if(damageDoubleFrom.contains(typeName.name)) {
                    if let index = damageDoubleFrom.firstIndex(of: typeName.name){
                        damageDoubleFrom.remove(at: index)
                    }
                    damageQuadFrom.append(typeName.name)
                }else {
                    damageDoubleFrom.append(typeName.name)
                }
                if(damageHalfFrom.contains(typeName.name)) {
                    if let index = damageHalfFrom.firstIndex(of: typeName.name){
                        damageHalfFrom.remove(at: index)
                    }
                    if let index = damageDoubleFrom.firstIndex(of: typeName.name){
                        damageDoubleFrom.remove(at: index)
                    }
                }
                if(noDamageFrom.contains(typeName.name)) {
                    if let index = damageDoubleFrom.firstIndex(of: typeName.name){
                        damageDoubleFrom.remove(at: index)
                    }
                }
            }
            for typeName in type.damageRelations.halfDamageFrom {
                if(damageHalfFrom.contains(typeName.name)) {
                    if let index = damageHalfFrom.firstIndex(of: typeName.name){
                        damageHalfFrom.remove(at: index)
                    }
                    damageQuarterFrom.append(typeName.name)
                }else {
                    damageHalfFrom.append(typeName.name)
                }
                if(damageDoubleFrom.contains(typeName.name)) {
                    if let index = damageHalfFrom.firstIndex(of: typeName.name){
                        damageHalfFrom.remove(at: index)
                    }
                    if let index = damageDoubleFrom.firstIndex(of: typeName.name){
                        damageDoubleFrom.remove(at: index)
                    }
                }
                if(noDamageFrom.contains(typeName.name)) {
                    if let index = damageHalfFrom.firstIndex(of: typeName.name){
                        damageHalfFrom.remove(at: index)
                    }
                }
            }
            for typeName in type.damageRelations.noDamageFrom {
                if(!noDamageFrom.contains(typeName.name)) {
                    noDamageFrom.append(typeName.name)
                }
                if(damageDoubleFrom.contains(typeName.name)) {
                    if let index = damageDoubleFrom.firstIndex(of: typeName.name){
                        damageDoubleFrom.remove(at: index)
                    }
                }
                if(damageHalfFrom.contains(typeName.name)) {
                    if let index = damageHalfFrom.firstIndex(of: typeName.name){
                        damageHalfFrom.remove(at: index)
                    }
                }
            }
        }
        
        return ( damageDoubleFrom: damageDoubleFrom, damageHalfFrom: damageHalfFrom, noDamageFrom: noDamageFrom, damageQuadFrom: damageQuadFrom, damageQuarterFrom: damageQuarterFrom)
    }
    
    func getEvolutionChain(url: String) {
        DispatchQueue.global().async {
            self.pokemonManager.getEvolutionChain(url: url) { data in
                DispatchQueue.main.async {
                    self.evolutionChain = data
                    //print(data)
                    //print(self.evolutionChain)
                }
            }
        }
    }
    
    // Returns formatted height/weight data as a string
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
    
    // Returns the last entry of an array of flavor text string, filtered by language parameter
    func filterFlavorTextLanguage(language: String) -> String {
        var textStrings = [String]()
        let flavorTexts = self.pokemonSpecies?.flavorTextEntries ?? [FlavorTextEntry]()
        for flavorText in flavorTexts {
            if flavorText.language?.name == language {
                textStrings.append(flavorText.flavorText ?? "N/A")
            }
        }
        return textStrings.last ?? "N/A"
    }
    
    // Formats Gender Rates into percentage-value strings
    func formatGenderRate(value: Int) -> (female: String, male: String) {
        let dValue = Double(value)
        let femaleString = String(format: "%.2f", (dValue * (1/8)) * 100)
        let maleString = String(format: "%.2f", (1 - (dValue * (1/8))) * 100)
        return (femaleString, maleString)

    }
    
    // Switches API full stat name, and returns an abbreviation
    func switchStatName(stat: String) -> String {
        switch(stat){
        case "hp":
            return "HP  "
        case "attack":
            return "ATK  "
        case "defense":
            return "DEF  "
        case "speed":
            return"SPD  "
        case "special-attack":
            return "SpATK"
        case "special-defense":
            return "SpDEF"
        default:
            return "N/A"
        }
    }
    
    // Gets Pokemon possible moves, and filters them by learn method
    func getMovesLists() -> (egg: [Move], level: [Move], machine: [Move], tutor: [Move]) {
        var eggMoves = [Move]()
        var levelMoves = [Move]()
        var machineMoves = [Move]()
        var tutorMoves = [Move]()
        
        for move in (self.pokemonDetails?.moves ?? [Move]()) {
            let methodName = move.versionGroupDetails.first?.moveLearnMethod.name ?? ""
            
            switch(methodName){
            case "egg":
                eggMoves.append(move)
            case "level-up":
                levelMoves.append(move)
            case "machine":
                machineMoves.append(move)
            case "tutor":
                tutorMoves.append(move)
            default:
                print("getMovesLists func: Could not organize method[\(methodName)] from move[\(move)] into a group.")
            }
        }
        
        return(egg: eggMoves, level: levelMoves, machine: machineMoves, tutor: tutorMoves)
    }
    
    // Gets possible locations Pokemon can be found from API
    func getPokemonLocations(url: String) {
        DispatchQueue.global().async {
            self.pokemonManager.getPokemonLocations(url: url) { data in
                DispatchQueue.main.async {
                    self.pokemonLocations = data
                    //print(self.pokemonLocations)
                    //print(data)
                }
            }
        }
    }
    
    // Parses Pokemon id# from 'Pokemon Species' url
    func parseID(url: String) -> String {
        var urlSrting = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon-species/", with: "")
        urlSrting = urlSrting.replacingOccurrences(of: "/", with: "")
        return urlSrting
    }
}
