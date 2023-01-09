//
//  SwiftUIAssignmentUITests.swift
//  SwiftUIAssignmentUITests
//
//  Created by Consultant on 1/7/23.
//

import XCTest

final class SwiftUIAssignmentUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let theExpec = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [theExpec], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(app.collectionViews.buttons["Violent Night"].exists)
        } else {
            XCTFail("Waited Too long")
        }
        
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Violent Night"]/*[[".cells.buttons[\"Violent Night\"]",".buttons[\"Violent Night\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        XCTAssertTrue(app.staticTexts["Violent Night"].exists)
        app.staticTexts["Violent Night"].tap()
        XCTAssertTrue(app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Popular Movies"].exists)
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Popular Movies"].tap()
        XCTAssertTrue( app.navigationBars["Popular Movies"].staticTexts["Popular Movies"].exists)
        app.navigationBars["Popular Movies"].staticTexts["Popular Movies"].tap()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
