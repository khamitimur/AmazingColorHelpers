//
//  AmazingHueHelpersTests+Rectangle.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_rectangle_whenHueIsNormal() {
        // given
        let hue: Float = 350.0
        
        // when
        let hues = AmazingHueHelpers.shared.rectangle(hue: hue)
        
        // then
        XCTAssertEqual(hues.0, 110.0)
        XCTAssertEqual(hues.1, 170.0)
        XCTAssertEqual(hues.2, 290.0)
    }
    
    func test_amazingHueHelpers_rectangle_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0

        // when
        let hues = AmazingHueHelpers.shared.rectangle(hue: hue)

        // then
        XCTAssertEqual(hues.0, 68.0)
        XCTAssertEqual(hues.1, 128.0)
        XCTAssertEqual(hues.2, 248.0)
    }

    func test_amazingHueHelpers_rectangle_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0

        // when
        let hues = AmazingHueHelpers.shared.rectangle(hue: hue)

        // then
        XCTAssertEqual(hues.0, 216.0)
        XCTAssertEqual(hues.1, 276.0)
        XCTAssertEqual(hues.2, 36.0)
    }

    func test_amazingHueHelpers_rectangle_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0

        // when
        let hues = AmazingHueHelpers.shared.rectangle(hue: hue)

        // then
        XCTAssertEqual(hues.0, 120.0)
        XCTAssertEqual(hues.1, 180.0)
        XCTAssertEqual(hues.2, 300.0)
    }
}
