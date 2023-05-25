//
//  TMModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - MachineDetails Model
struct MachineDetails: Codable, Identifiable {
    let id: Int
    let item, move, versionGroup: URLObject

    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
    
    static var sample = MachineDetails(id: 1, item: URLObject(name: "tm00", url: "https://pokeapi.co/api/v2/item/1288/"), move: URLObject(name: "mega-punch", url: "https://pokeapi.co/api/v2/move/5/"), versionGroup: URLObject(name: "sword-shield", url: "https://pokeapi.co/api/v2/version-group/20/"))
}
 
// MARK: - MachineElement Model
struct MachineElement: Codable, Equatable, Identifiable {
    let id = UUID()
    let url: String
}

// MARK: - MachineResourceList Model
struct MachineResourceList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [MachineElement]
}
