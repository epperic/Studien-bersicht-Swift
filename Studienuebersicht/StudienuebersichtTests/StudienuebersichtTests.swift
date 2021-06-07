//
//  StudienuebersichtTests.swift
//  StudienuebersichtTests
//
//  Created by Eric Epp on 19.05.21.
//

import XCTest
@testable import Studienuebersicht

class StudienuebersichtTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetch() {
        let expectation = self.expectation(description: "Async Complete")
        let api = FirebaseAPI()
        api.fetchData(){
            switch $0{
            case let .success(response) : XCTAssert(response.count > 0)
            case let .failure(error) : XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testSplitSemester() {
        let collection = CollectionViewModel()
        collection.module = [
            ModulViewModel(Id: "1", Modulname: "Mathematik I", Professor: "Ponick", ECTS: 6, Note: 1.3, Semester: 1),
            ModulViewModel(Id: "2", Modulname: "Personal Skills I", Professor: "Grewe", ECTS: 3, Note: 1.7, Semester: 1),
            ModulViewModel(Id: "3", Modulname: "Grundlagen der Informatik I", Professor: "Stuckenholz", ECTS: 8, Note: 2.5, Semester: 1),
            ModulViewModel(Id: "4", Modulname: "Mathematik II", Professor: "Ponick", ECTS: 5, Note: 4.0, Semester: 2),
            ModulViewModel(Id: "5", Modulname: "Personal Skills II", Professor: "Grewe", ECTS: 3, Note: 1.7, Semester: 2),
            ModulViewModel(Id: "6", Modulname: "Grundlagen der Informatik II", Professor: "Stuckenholz", ECTS: 8, Note: 2.0, Semester: 2),
            ModulViewModel(Id: "7", Modulname: "Embedded Systems", Professor: "Pelzl", ECTS: 8, Note: 1.7, Semester: 3),
            ModulViewModel(Id: "8", Modulname: "Personal Skills III", Professor: "Klein", ECTS: 3, Note: 1.4, Semester: 3),
            ModulViewModel(Id: "9", Modulname: "Praktische Informatik", Professor: "Stuckenholz", ECTS: 5, Note: 1.3, Semester: 3)
        ]
        collection.splitSemesters()
        //check if grouping by semester was correct
        XCTAssertTrue(collection.splitsemestermodule[0].count == 3)
        XCTAssertTrue(collection.splitsemestermodule[1].count == 3)
        XCTAssertTrue(collection.splitsemestermodule[2].count == 3)
        //check if the Array of arrays is asc sorted by semester
        XCTAssertTrue(collection.splitsemestermodule[0][0].Semester < collection.splitsemestermodule[1][0].Semester)
        XCTAssertTrue(collection.splitsemestermodule[1][0].Semester < collection.splitsemestermodule[2][0].Semester)
    }
}
