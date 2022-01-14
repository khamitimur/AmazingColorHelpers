//
//  AmazingColorHelpersTests+Normalized+HueSaturationBrightness.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_normalized_hue_saturation_brightness_whenAllValuesAreLowerThanNormal() {
        // given
        let hue: Int = -12
        let saturation: Int = -23
        let brightness: Int = -100
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 0)
        XCTAssertEqual(nSaturation, 0)
        XCTAssertEqual(nBrightness, 0)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_brightness_whenAllValuesAreHigherThanNormal() {
        // given
        let hue: Int = 456
        let saturation: Int = 123
        let brightness: Int = 1029
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 0)
        XCTAssertEqual(nSaturation, 100)
        XCTAssertEqual(nBrightness, 100)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_brightness_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Int = 360
        let saturation: Int = 65
        let brightness: Int = 95
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 0)
        XCTAssertEqual(nSaturation, saturation)
        XCTAssertEqual(nBrightness, brightness)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_brightness_whenAllValuesAreNormal() {
        // given
        let hue: Int = 350
        let saturation: Int = 65
        let brightness: Int = 95
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, hue)
        XCTAssertEqual(nSaturation, saturation)
        XCTAssertEqual(nBrightness, brightness)
    }
}
