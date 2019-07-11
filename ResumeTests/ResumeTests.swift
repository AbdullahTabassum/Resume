//
//  ResumeTests.swift
//  ResumeTests
//
//  Created by Abdullah Tabassum on 2019-07-09.
//  Copyright © 2019 Abdullah Tabassum. All rights reserved.
//

import XCTest
@testable import Resume
/// testing the ResumeViewModel
class ResumeTests: XCTestCase {

    var resumeViewModel: ResumeViewModel?

    override func setUp() {
        if let resume = loadResume(file: "resume") {
            resumeViewModel = ResumeVM(res: resume)
        }
    }

    func testPhoneNumber() {
        XCTAssertEqual(resumeViewModel?.phone, "416-834-9260")
    }

    func testAddress() {
        XCTAssertEqual(resumeViewModel?.address, "3842 - Scope ave. - Toronto - Canada")
    }

    func testLanguages() {
        XCTAssertEqual(resumeViewModel?.language, "English, Arabic, Swahili, Urdu, Spanish, German")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension ResumeTests {
    func loadResume(file: String) -> Resume? {
        let lParser = ParserImpl()
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let resume = lParser.decode(type: Resume.self, from: data) {
                    return resume
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}
