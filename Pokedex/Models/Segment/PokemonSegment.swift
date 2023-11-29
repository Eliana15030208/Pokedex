//
//  PokemonSegment.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 13/02/22.
//

import Foundation

enum PokemosSegementType: Int {
    case info = 1
    case moves
}

struct PokemosSegement: Hashable, Identifiable {
    var id: Int = PokemosSegementType.info.rawValue
    var type: PokemosSegementType = .info
    var name: String = "Info"
}

#if DEBUG
extension PokemosSegement {
    static var mock = PokemosSegement(id: PokemosSegementType.info.rawValue,
                                      type: .info,
                                      name: "Info")
    static func mock(id: Int = PokemosSegementType.info.rawValue,
                     type: PokemosSegementType = .info,
                     name: String = "Info") -> PokemosSegement {
        .init(id: id,
              type: type,
              name: name)
    }
}
#endif
