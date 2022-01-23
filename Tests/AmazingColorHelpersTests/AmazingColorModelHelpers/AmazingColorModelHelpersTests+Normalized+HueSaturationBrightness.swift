//
//  AmazingColorModelHelpersTests+Normalized+HueSaturationBrightness.swift
//
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorModelHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorModelHelpers_normalized_hue_saturation_brightness_whenAllValuesAreLowerThanNormal() {
        // given
        let hue: Float = -412.0
        let saturation: Float = -23.0
        let brightness: Float = -100.0
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorModelHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 308.0)
        XCTAssertEqual(nSaturation, 0.0)
        XCTAssertEqual(nBrightness, 0.0)
    }
    
    func test_amazingColorModelHelpers_normalized_hue_saturation_brightness_whenAllValuesAreHigherThanNormal() {
        // given
        let hue: Float = 456.0
        let saturation: Float = 123.0
        let brightness: Float = 1029.0
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorModelHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 96.0)
        XCTAssertEqual(nSaturation, 100.0)
        XCTAssertEqual(nBrightness, 100.0)
    }
    
    func test_amazingColorModelHelpers_normalized_hue_saturation_brightness_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        let saturation: Float = 65.0
        let brightness: Float = 95.0
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorModelHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(nHue, 0.0)
        XCTAssertEqual(nSaturation, saturation)
        XCTAssertEqual(nBrightness, brightness)
    }
    
    func test_amazingColorModelHelpers_normalized_hue_saturation_brightness_whenAllValuesAreNormal() {
        // given
        let hue: Float = 350.0
        let saturation: Float = 65.0
        let brightness: Float = 95.0
        
        // when
        let (nHue, nSaturation, nBrightness) = AmazingColorModelHelpers.shared.normalized(
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
