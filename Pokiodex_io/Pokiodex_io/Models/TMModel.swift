//
//  TMModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

// MARK: - MachineDetails
struct MachineDetails: Codable {
    let id: Int
    let item, move, versionGroup: URLObject

    enum CodingKeys: String, CodingKey {
        case id, item, move
        case versionGroup = "version_group"
    }
}
