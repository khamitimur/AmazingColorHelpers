//
//  AmazingHueHelpersTests+Complementary.swift
//
//
//  Created by Timur Khamidov on 21.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_complementary_whenHueIsNormal() {
        // given
        let hue: Float = 350
        
        // when
        let cHue = AmazingHueHelpers.shared.complementary(hue: hue)
        
        // then
        XCTAssertEqual(cHue, 170.0)
    }
    
    func test_amazingHueHelpers_complementary_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0
        
        // when
        let cHue = AmazingHueHelpers.shared.complementary(hue: hue)
        
        // then
        XCTAssertEqual(cHue, 128.0)
    }
    
    func test_amazingHueHelpers_complementary_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0
        
        // when
        let cHue = AmazingHueHelpers.shared.complementary(hue: hue)
        
        // then
        XCTAssertEqual(cHue, 276.0)
    }
    
    func test_amazingHueHelpers_complementary_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        
        // when
        let cHue = AmazingHueHelpers.shared.complementary(hue: hue)
        
        // then
        XCTAssertEqual(cHue, 180.0)
    }
}
