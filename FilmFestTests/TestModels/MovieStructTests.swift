//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Kasun Gayashan on 10.02.22.
//

import XCTest
@testable import FilmFest

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    // MARK: Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_MovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Generic Blockbuster", releaseDate: "2023.12.12")
        XCTAssertEqual(testMovie.releaseDate, "2023.12.12")
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "2012")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2014")
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
}
