//
//  MovesTests.swift
//  PokedexTests
//
//  Created by Eliana Bohorquez on 05/03/22.
//

import XCTest
@testable import Pokedex

class MovesTests: XCTestCase {
    func testLoadMoves() throws {
        let viewModel = MoveViewModel(.mock(moves: { _ in
            Effect(value: .mock).eraseToAnyPublisher()
        }),
        url: "https://pokeapi.co/api/v2/move/13/",
        isFirst: true)
        
        viewModel.move = .mock
        
        XCTAssert(viewModel.move.id == 1)
    }
    
    func testFailedMoves() throws {
        let viewModel = MoveViewModel(.mock(moves: { _ in
            Effect(error: ErrorMessage("Failure"))
                .eraseToAnyPublisher()
        }),
        url: "https://pokeapi.co/api/v2/move/13/",
        isFirst: true)
        
        XCTAssert(viewModel.move.id == .zero)
    }
}
