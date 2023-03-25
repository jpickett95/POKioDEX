//
//  ItemModel.swift
//  Pokiodex_io
//
//  Created by Jonah Pickett on 3/25/23.
//

import Foundation

struct Item: Codable {
    let id: Int     // identifier
    let name: String    // resource name
    let cost: Int       // price of this item in stores
    let fling_power: Int    // power of the move Fling when used with this item
}
