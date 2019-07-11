//
//  ResumeUITests.swift
//  ResumeUITests
//
//  Created by Abdullah Tabassum on 2019-07-11.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import XCTest

class ResumeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        //XCUIApplication().launch()

        app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowingLabels() {
        app.launch()

        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.nameTitle].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.contactInfo].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.experience].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.language].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.languageTitle].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.address].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.objective].exists)
        XCTAssertTrue(app.staticTexts[ResumeView.AccessilibityIdentifiers.objectiveTitle].exists)

    }
   

}
