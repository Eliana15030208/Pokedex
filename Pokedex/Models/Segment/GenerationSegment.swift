//
//  GenerationSegment.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 13/02/22.
//

import Foundation

enum GenerationType: Int {
    case i = 1
    case ii
    case iii
    case iv
}

struct GenerationSegment: Hashable, Identifiable {
    var id: Int = GenerationType.i.rawValue
    var generation: GenerationType = .i
    var name: String = "I"
}

#if DEBUG
extension GenerationSegment {
    static var mock = GenerationSegment(id: GenerationType.i.rawValue,
                                        generation: .i,
                                        name: "I")
    static func mock(id: Int = GenerationType.i.rawValue,
                     generation: GenerationType = .i,
                     name: String = "I") -> GenerationSegment {
        .init(id: id,
              generation: generation,
              name: name)
    }
}
#endif
