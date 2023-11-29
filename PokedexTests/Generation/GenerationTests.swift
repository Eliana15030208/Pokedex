//
//  GenerationTests.swift
//  PokedexTests
//
//  Created by Eliana Bohorquez on 05/03/22.
//

import XCTest
@testable import Pokedex

class GenerationTests: XCTestCase {
    
    func testLoadGeneration() throws {
        let viewModel = GenerationViewModel(.mock(generation: { (_, _) in
            Effect(value: .mock)
                .eraseToAnyPublisher()
        }))
        viewModel.generation = .mock
        
        XCTAssert(viewModel.generation.id == 1)
    }
    
    func testFailedGeneration() throws {
        let viewModel = GenerationViewModel(.mock(generation: { (_, _) in
            Effect(error: ErrorMessage("Failure"))
                .eraseToAnyPublisher()
        }))
        
        XCTAssert(viewModel.generation.id == .zero)
    }
}
