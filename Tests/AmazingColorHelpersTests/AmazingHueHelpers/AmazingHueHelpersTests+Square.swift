//
//  AmazingHueHelpersTests+Square.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_square_whenHueIsNormal() {
        // given
        let hue: Float = 350.0
        
        // when
        let hues = AmazingHueHelpers.shared.square(hue: hue)
        
        // then
        XCTAssertEqual(hues.0, 80.0)
        XCTAssertEqual(hues.1, 170.0)
        XCTAssertEqual(hues.2, 260.0)
    }
    
    func test_amazingHueHelpers_square_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0

        // when
        let hues = AmazingHueHelpers.shared.square(hue: hue)

        // then
        XCTAssertEqual(hues.0, 38.0)
        XCTAssertEqual(hues.1, 128.0)
        XCTAssertEqual(hues.2, 218.0)
    }

    func test_amazingHueHelpers_square_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0

        // when
        let hues = AmazingHueHelpers.shared.square(hue: hue)

        // then
        XCTAssertEqual(hues.0, 186.0)
        XCTAssertEqual(hues.1, 276.0)
        XCTAssertEqual(hues.2, 6.0)
    }

    func test_amazingHueHelpers_square_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0

        // when
        let hues = AmazingHueHelpers.shared.square(hue: hue)

        // then
        XCTAssertEqual(hues.0, 90.0)
        XCTAssertEqual(hues.1, 180.0)
        XCTAssertEqual(hues.2, 270.0)
    }
}
