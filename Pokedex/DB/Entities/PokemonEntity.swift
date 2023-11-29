//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 24/02/22.
//

import Foundation
import RealmSwift

class PokemonEntity: Object {
    static let idKey = "id"
    
    @objc dynamic var id: Int = .zero
    @objc dynamic var name: String = ""
    @objc dynamic var status: Int = .zero
    
    override static func primaryKey() -> String? {
        return idKey
    }
}
