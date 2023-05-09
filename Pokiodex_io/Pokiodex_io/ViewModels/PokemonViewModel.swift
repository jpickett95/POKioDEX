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
    @Published var pokemonAbilities: Ability?
    @Published var pokemonSpecies: PokemonSpecies?
    @Published var searchText = ""
    @Published var pokemonLocations: [LocationAreaEncounter]?
    
    // Filtered pokemonList for searchbar
    var filteredPokemon: [Pokemon] {
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
    
//    func populateDetailsList(pokemon: Pokemon) {
//        self.getDetails(pokemon: pokemon)
//        if let details = self.pokemonDetails {
//            self.detailsList.append(details)
//            print(detailsList)
//        }
//    }
    
    // Returns Pokedex id# of input 'Pokemon'
    func getPokemonID(pokemon: Pokemon) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) {
            return id + 1
        }
        return 0
    }
    
    // Uses manager to populate self.pokemonDetails with 'PokemonDetails' from PokeAPI
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonID(pokemon: pokemon) // get id#
        
        // instantiate variables
        self.pokemonDetails = PokemonDetails(id: 0, name: "Bulbasaur", height: 0, weight: 0, stats: [PokemonStats(base_stat: 0, effort: 0, stat: SpecificStat(name: "", url: "", id: 0, game_index: 0, is_battle_only: false))], types: [PokemonTypes(slot: 0, type: SpecificType(name: "", url: "", id: 0, move_damage_class: MoveDamageClass(id: 0, name: "", descriptions: [Description](), names: [Name](), move: [PokemonMove]()), names: [Name](), moves: [MoveDetails](), pokemon: [TypePokemon](), damage_relations: TypeRelations(no_damage_to: [SpecificType](), half_damage_to: [SpecificType](), double_damage_to: [SpecificType](), no_damage_from: [SpecificType](), half_damage_from: [SpecificType](), double_damage_from: [SpecificType]()), past_damage_relations: [TypeRelationsPast]()))], abilities: [PokemonAbility(is_hidden: false, slot: 0, ability: Ability(id: 0, name: "", is_main_series: true, effect_entries: [VerboseEffect(effect: "", short_effect: "", language: Language.sample)], effect_changes: [AbilityEffectChange(effect_entries: [Effect(effect: "", language: Language.sample)], version_group: VersionGroup(id: 0, name: "", order: 0))], flavor_text_entries: [AbilityFlavorText(flavor_text: "", language: Language.sample, version_group: VersionGroup(id: 0, name: "", order: 0))]))], species: PokemonSpecies(id: 0, name: "", order: 0, gender_rate: 0, capture_rate: 0, base_happiness: 0, is_baby: false, is_legendary: false, is_mythical: false, hatch_counter: 0, has_gender_differences: false, forms_switchable: false, flavor_text_entries: [FlavorText(flavor_text: "", language: Language.sample, version: Version(id: 0, name: "", names: [Name(name: "", language: Language.sample)], version_group: VersionGroup.sample))]), sprites: PokemonSprites(front_default: "", front_shiny: "", front_female: "", front_shiny_female: "", back_default: "", back_shiny: "", back_female: "", back_shiny_female: "", other: OtherSprites(dream_world: DreamWorld(front_default: "", front_female: ""), home: HomeSprite(front_default: "", front_female: "", front_shiny: "", front_shiny_female: ""), official_artwork: OfficialArtwork(front_default: "", front_shiny: ""))), moves: [PokemonLearnedMove](), location_area_encounters: "")
        self.pokemonStats = SpecificStat(name: "", url: "", id: 0, game_index: 0, is_battle_only: false)
        self.pokemonTypes = SpecificType(name: "", url: "", id: 0, move_damage_class: MoveDamageClass(id: 0, name: "", descriptions: [Description](), names: [Name](), move: [PokemonMove]()), names: [Name](), moves: [MoveDetails](), pokemon: [TypePokemon](), damage_relations: TypeRelations(no_damage_to: [SpecificType](), half_damage_to: [SpecificType](), double_damage_to: [SpecificType](), no_damage_from: [SpecificType](), half_damage_from: [SpecificType](), double_damage_from: [SpecificType]()), past_damage_relations: [TypeRelationsPast]())
        self.pokemonAbilities = Ability(id: 0, name: "", is_main_series: true, effect_entries: [VerboseEffect(effect: "", short_effect: "", language: Language.sample)], effect_changes: [AbilityEffectChange](), flavor_text_entries: [AbilityFlavorText]())
        self.pokemonSpecies = PokemonSpecies(id: 0, name: "", order: 0, gender_rate: 0, capture_rate: 0, base_happiness: 0, is_baby: false, is_legendary: false, is_mythical: false, hatch_counter: 0, has_gender_differences: false, forms_switchable: false, flavor_text_entries: [FlavorText]())
        
        DispatchQueue.global().async {
            // get 'PokemonDetails'
            self.pokemonManager.getDetailedPokemon(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonDetails = data
                    //print(self.pokemonDetails)
                }
            }
            
            // get 'SpecificStat'
            self.pokemonManager.getPokemonStats(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonStats = data
                }
            }
            
            // get 'SpecificType'
            self.pokemonManager.getPokemonTypes(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonTypes = data
                }
            }
            
            // get 'Abilities'
            self.pokemonManager.getPokemonAbilities(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonAbilities = data
                    //print(self.pokemonAbilities)
                }
            }
            
            // get 'PokemonSpecies'
            self.pokemonManager.getPokemonSpecies(id: id) { data in
                DispatchQueue.main.async {
                    self.pokemonSpecies = data
                    //print(self.pokemonSpecies)
                }
            }
            
        }
    }
    
    func copyDetails() -> PokemonDetails {
        if let details = self.pokemonDetails {
            return details
        }
        return PokemonDetails.sampleDetails
    }
    
    // Returns formatted data as a string
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
    
    func formatFlavorText(string: String) -> String {
        return string.replacingOccurrences(of: "\n", with: " ")
    }
    
    func formatGenderRate(value: Int) -> (female: String, male: String) {
        let dValue = Double(value)
        let femaleString = String(format: "%.2f", (dValue * (1/8)) * 100)
        let maleString = String(format: "%.2f", (1 - (dValue * (1/8))) * 100)
        return (femaleString, maleString)

    }
    
    func switchType() -> String {
        switch self.pokemonDetails?.types.first?.type.name.uppercased() {
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
    
    func getMovesLists() -> (egg: [PokemonLearnedMove], level: [PokemonLearnedMove], machine: [PokemonLearnedMove], tutor: [PokemonLearnedMove]) {
        var eggMoves = [PokemonLearnedMove]()
        var levelMoves = [PokemonLearnedMove]()
        var machineMoves = [PokemonLearnedMove]()
        var tutorMoves = [PokemonLearnedMove]()
        
        for move in (self.pokemonDetails?.moves ?? [PokemonLearnedMove]()) {
            let methodName = move.version_group_details.first?.move_learn_method.name ?? ""
            
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
    
    func getPokemonLocations() {
        DispatchQueue.global().async {
            let url = self.pokemonDetails?.location_area_encounters ?? ""
            self.pokemonManager.getPokemonLocations(url: url) { data in
                DispatchQueue.main.async {
                    self.pokemonLocations = data
                    print(self.pokemonLocations)
                }
            }
        }
    }
}
