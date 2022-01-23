//
//  AmazingHueHelpersTests+SplitComplementary.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_splitComplementary_whenHueIsNormal() {
        // given
        let hue: Float = 350.0
        
        // when
        let hues = AmazingHueHelpers.shared.splitComplementary(hue: hue)
        
        // then
        XCTAssertEqual(hues.0, 200.0)
        XCTAssertEqual(hues.1, 140.0)
    }
    
    func test_amazingHueHelpers_splitComplementary_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0

        // when
        let hues = AmazingHueHelpers.shared.splitComplementary(hue: hue)

        // then
        XCTAssertEqual(hues.0, 158.0)
        XCTAssertEqual(hues.1, 98.0)
    }

    func test_amazingHueHelpers_splitComplementary_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0

        // when
        let hues = AmazingHueHelpers.shared.splitComplementary(hue: hue)

        // then
        XCTAssertEqual(hues.0, 306.0)
        XCTAssertEqual(hues.1, 246.0)
    }

    func test_amazingHueHelpers_splitComplementary_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0

        // when
        let hues = AmazingHueHelpers.shared.splitComplementary(hue: hue)

        // then
        XCTAssertEqual(hues.0, 210.0)
        XCTAssertEqual(hues.1, 150.0)
    }
}
