//
//  SwiftUIAssignmentTests.swift
//  SwiftUIAssignmentTests
//
//  Created by Consultant on 1/7/23.
//

import XCTest
@testable import SwiftUIAssignment

final class SwiftUIAssignmentTests: XCTestCase {

    var sut: jsonAPI!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = jsonAPI()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testExample() throws {
        sut.getJSONData()
        let theExpec = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [theExpec], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.popularData.results.count > 1)
            XCTAssertTrue(sut.movie[sut.popularData.results.randomElement()!.id] != nil)
        } else {
            XCTFail("Waited Too long")
        }
    }
}
