//
//  TMModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct Machine: Codable {
    let id: Int                         // identifier
    let item: Item                      // the TM or HM item that corresponds to this machine
    let move: PokemonMove               // move that is taught by this machine
    let version_group: VersionGroup     // vversion group this machine applies to
}

struct MachineVersionDetail: Codable {
    let machine: Machine                // machine that teaches a move from an item
    let version_group: VersionGroup     // version group of this specific machine
}
