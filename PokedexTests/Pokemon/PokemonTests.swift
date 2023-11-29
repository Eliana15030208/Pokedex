//
//  PokemonTests.swift
//  PokedexTests
//
//  Created by Eliana Bohorquez on 05/03/22.
//

import XCTest
@testable import Pokedex

class PokemonTests: XCTestCase {
    func testLoadPokemon() throws {
        let viewModel = PokemonDetailViewModel(.mock(pokemon: { _, _ in
            Effect(value: .mock).eraseToAnyPublisher()
        }), type: .i, id: 1)
        viewModel.pokemon = .mock
        
        XCTAssert(viewModel.pokemon.id == 1)
    }
    
    func testFailedPokemon() throws {
        let viewModel = PokemonDetailViewModel(.mock(pokemon: { _, _ in
            Effect(error: ErrorMessage("Failure"))
                .eraseToAnyPublisher()
        }), type: .i, id: 1)
        
        XCTAssert(viewModel.pokemon.id == .zero)
    }
}
