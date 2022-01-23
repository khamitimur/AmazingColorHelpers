//
//  AmazingHueHelpersTests+Analogus.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_analogus_whenHueIsNormal() {
        // given
        let hue: Float = 350.0
        
        // when
        let hues = AmazingHueHelpers.shared.analogus(hue: hue)
        
        // then
        XCTAssertEqual(hues.0, 320.0)
        XCTAssertEqual(hues.1, 20.0)
    }
    
    func test_amazingHueHelpers_analogus_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0

        // when
        let hues = AmazingHueHelpers.shared.analogus(hue: hue)

        // then
        XCTAssertEqual(hues.0, 278.0)
        XCTAssertEqual(hues.1, 338.0)
    }

    func test_amazingHueHelpers_analogus_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0

        // when
        let hues = AmazingHueHelpers.shared.analogus(hue: hue)

        // then
        XCTAssertEqual(hues.0, 66.0)
        XCTAssertEqual(hues.1, 126.0)
    }

    func test_amazingHueHelpers_analogus_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0

        // when
        let hues = AmazingHueHelpers.shared.analogus(hue: hue)

        // then
        XCTAssertEqual(hues.0, 330.0)
        XCTAssertEqual(hues.1, 30.0)
    }
}
