//
//  Collection.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 23/02/22.
//

import Foundation

extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}
