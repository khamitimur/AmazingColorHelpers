//
//  AmazingHueHelpersTests+Triadic.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_triadic_whenHueIsNormal() {
        // given
        let hue: Float = 350.0
        
        // when
        let hues = AmazingHueHelpers.shared.triadic(hue: hue)
        
        // then
        XCTAssertEqual(hues.0, 230.0)
        XCTAssertEqual(hues.1, 110.0)
    }
    
    func test_amazingHueHelpers_triadic_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0

        // when
        let hues = AmazingHueHelpers.shared.triadic(hue: hue)

        // then
        XCTAssertEqual(hues.0, 188.0)
        XCTAssertEqual(hues.1, 68.0)
    }

    func test_amazingHueHelpers_triadic_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0

        // when
        let hues = AmazingHueHelpers.shared.triadic(hue: hue)

        // then
        XCTAssertEqual(hues.0, 336.0)
        XCTAssertEqual(hues.1, 216.0)
    }

    func test_amazingHueHelpers_triadic_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0

        // when
        let hues = AmazingHueHelpers.shared.triadic(hue: hue)

        // then
        XCTAssertEqual(hues.0, 240.0)
        XCTAssertEqual(hues.1, 120.0)
    }
}
