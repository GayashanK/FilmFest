//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Kasun Gayashan on 12.02.22.
//

import XCTest
@testable import FilmFest

class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var tableViewMock: TableViewMock!
    var libraryTableView: UITableView!
    var libraryViewController: LibraryViewController!
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        libraryViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryViewController?.view
        libraryTableView = libraryViewController?.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        
    }
    
    //MARK: Section
    func testTableViewSections_Count_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_RowsCount_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.addMovie(movie: scifiMovie)
//        sut.movieManager?.addMovie(movie: arthouseMovie)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        sut.movieManager?.addMovie(movie: actionMovie)
//        libraryTableView.reloadData()
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_RowsCount_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.addMovie(movie: scifiMovie)
//        sut.movieManager?.addMovie(movie: arthouseMovie)
//        sut.movieManager?.addMovie(movie: actionMovie)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    //MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: scifiMovie)
        libraryTableView.reloadData()
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: scifiMovie)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: scifiMovie)
        tableViewMock.reloadData()
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as? MovieCellMock
        XCTAssertEqual(cell?.movieData, scifiMovie)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as? MovieCellMock
        XCTAssertEqual(cell?.movieData, scifiMovie)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: arthouseMovie)
        libraryTableView.reloadData()
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.movieSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues() {
        let sectionOneTitle = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let sectionTwoTitle = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        XCTAssertEqual(sectionOneTitle, "Movies To See")
        XCTAssertEqual(sectionTwoTitle, "Movies Seen")
    }
}


