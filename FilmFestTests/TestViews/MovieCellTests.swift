//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Kasun Gayashan on 16.02.22.
//

import XCTest
@testable import FilmFest

class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        let libraryViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryViewController?.view
        tableView = libraryViewController?.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        
    }
    
    func testCell_Config_ShouldSetLablesToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as? MovieCell
        cell?.configMovieCell(movie: Movie(title: "Comedy", releaseDate: "2012"))
        XCTAssertEqual(cell?.textLabel?.text, "Comedy")
        XCTAssertEqual(cell?.detailTextLabel?.text, "2012")
    }
}
