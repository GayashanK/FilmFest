//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Kasun Gayashan on 11.02.22.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        self.sut = MovieManager() //self.sut - system under test
    }

    override func tearDownWithError() throws {
        
    }

    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(self.sut.moviesToSeeCount, 0)
    }

    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(self.sut.movieSeenCount, 0)
    }
    
    // MARK: Add and Query
    
    func testAdd_MoviesToSee_ReturnsOne() {
        self.sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(self.sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        self.sut.addMovie(movie: arthouseMovie)
        let movieQueried = self.sut.movieAtIndex(index: 0)
        XCTAssertEqual(movieQueried.title, arthouseMovie.title)
    }
    
    // MARK: Checking Off
    
    func testCheckOff_Movie_UpdatesMovieManagerCounts() {
        self.sut.addMovie(movie: actionMovie)
        self.sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(self.sut.moviesToSeeCount, 0)
        XCTAssertEqual(self.sut.movieSeenCount, 1)
    }
    
    func testCheckOff_Movie_RemoveMovie() {
        self.sut.addMovie(movie: actionMovie)
        self.sut.addMovie(movie: arthouseMovie)
        self.sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(self.sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOff_Movie_ReturnsMovieAtIndex() {
        self.sut.addMovie(movie: scifiMovie)
        self.sut.checkOffMovieAtIndex(index: 0)
        let movieQueried = self.sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(movieQueried.title, scifiMovie.title)
    }
    
    //MARK: Clearing and Resetting
    func testClearArrays_ReturnsArrayCountsOfZero() {
        self.sut.addMovie(movie: scifiMovie)
        self.sut.addMovie(movie: actionMovie)
        self.sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(self.sut.moviesToSeeCount, 1)
        XCTAssertEqual(self.sut.movieSeenCount, 1)
        self.sut.clearArrays()
        XCTAssertEqual(self.sut.moviesToSeeCount, 0)
        XCTAssertEqual(self.sut.movieSeenCount, 0)
    }
    
    //MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        self.sut.addMovie(movie: scifiMovie)
        self.sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
} 
