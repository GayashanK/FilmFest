//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by Kasun Gayashan on 11.02.22.
//

import XCTest
@testable import FilmFest

class LibraryViewControllerTests: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUpWithError() throws {
        self.sut = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = sut.view
    }

    override func tearDownWithError() throws {
        
    }

    //MARK: Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(self.sut.libraryTableView)
    }
    
    //MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: Data Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView?.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumptions
    //SetsDataSourceAndDelegateToSameObject
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
}
