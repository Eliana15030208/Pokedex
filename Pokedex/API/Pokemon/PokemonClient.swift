//
//  PokemonClient.swift
//  Pokedex
//
//  Created by Eliana Bohorquez on 10/01/22.
//

import Foundation
import Combine

struct PokemonClient {
    var pokemon: (_ path: APIPath, _ id: Int) -> AnyPublisher<PokemonDetail, Error>
    var moves: (_ path: String) -> AnyPublisher<Move, Error>
}

// MARK: - LIVE
extension PokemonClient {
    static var live = PokemonClient { path, id in
        guard let components = URLComponents(url: Constant.default.Base.appendingPathComponent(path.rawValue + "/\(id)"),
                                             resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }
        let request = URLRequest(url: components.url!)
        return Constant.default.Api.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    } moves: { path in
        guard let components = URLComponents(url: URL(string: path)!,
                                             resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }
        let request = URLRequest(url: components.url!)
        
        return Constant.default.Api.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

#if DEBUG
// MARK: - MOCK
extension PokemonClient {
    static var mock = PokemonClient { _, _ in Effect<PokemonDetail, Error>(value: .mock).eraseToAnyPublisher()
    } moves: { _ in Effect<Move, Error>(value: .mock).eraseToAnyPublisher() }
    
    static func mock(pokemon: @escaping (_ path: APIPath, _ id: Int) -> AnyPublisher<PokemonDetail, Error> = { _, _ in fatalError() },
                     moves: @escaping (_ path: String) -> AnyPublisher<Move, Error> = { _ in fatalError() }) -> PokemonClient {
        .init(pokemon: pokemon,
              moves: moves)
    }
}
#endif
