//
//  AmazingHueHelpersTests+Normalized.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests
    
    func test_amazingHueHelpers_normalized_whenHueIsNormal() {
        // given
        let hue: Float = 350
        
        // when
        let nHue = AmazingHueHelpers.shared.normalized(hue: hue)
        
        // then
        XCTAssertEqual(nHue, hue)
    }
    
    func test_amazingHueHelpers_normalized_whenHueIsLowerThanNormal() {
        // given
        let hue: Float = -412.0
        
        // when
        let nHue = AmazingHueHelpers.shared.normalized(hue: hue)
        
        // then
        XCTAssertEqual(nHue, 308.0)
    }
    
    func test_amazingHueHelpers_normalized_whenHueIsHigherThanNormal() {
        // given
        let hue: Float = 456.0
        
        // when
        let nHue = AmazingHueHelpers.shared.normalized(hue: hue)
        
        // then
        XCTAssertEqual(nHue, 96.0)
    }
    
    func test_amazingHueHelpers_normalized_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        
        // when
        let nHue = AmazingHueHelpers.shared.normalized(hue: hue)
        
        // then
        XCTAssertEqual(nHue, 0.0)
    }
}
