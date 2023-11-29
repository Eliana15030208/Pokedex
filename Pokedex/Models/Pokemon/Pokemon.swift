//
//  Pokemon.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 12/02/22.
//

import Foundation

enum ArtworkBase: String {
    case i = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/"
    case ii = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/"
    case iii = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/"
    case iv = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/"
    case homologate = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
}

struct Pokemon: Identifiable, Hashable, Codable {
    var id: UUID? = UUID()
    var name: String = ""
    var url: String = ""
}

extension Pokemon {
    func getId() -> Int {
        let id = URL(string: url)?.lastPathComponent ?? "0"
        return Int(id) ?? .zero
    }
    
    func artwork(type: GenerationType = .i) -> URL {
        let image = (URL(string: url)?.lastPathComponent ?? "0") + ".png"
        return URL(string: ArtworkBase.homologate.rawValue + image)!
    }
}

#if DEBUG
extension Pokemon {
    static var mock = Pokemon(name: "bulbasaur",
                              url: "https://pokeapi.co/api/v2/pokemon-species/1/")
    static func mock(id: UUID = UUID(),
                     name: String = "bulbasaur",
                     url: String = "https://pokeapi.co/api/v2/pokemon-species/1/") -> Pokemon {
        .init(id: id,
              name: name,
              url: url)
    }
}
#endif

