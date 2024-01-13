//
//  Pokemon.swift
//  PokedexTest
//
//  Created by Pedro Toro on 10/3/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
