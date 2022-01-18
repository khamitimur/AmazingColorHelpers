//
//  AmazingColorHelpersTests+Normalized+HueSaturationLightness.swift
//  
//
//  Created by Timur Khamidov on 16.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_normalized_hue_saturation_lightness_whenAllValuesAreLowerThanNormal() {
        // given
        let hue: Float = -12.0
        let saturation: Float = -23.0
        let lightness: Float = -100.0
        
        // when
        let (nHue, nSaturation, nLightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(nHue, 0.0)
        XCTAssertEqual(nSaturation, 0.0)
        XCTAssertEqual(nLightness, 0.0)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_lightness_whenAllValuesAreHigherThanNormal() {
        // given
        let hue: Float = 456.0
        let saturation: Float = 123.0
        let lightness: Float = 1029.0
        
        // when
        let (nHue, nSaturation, nLightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(nHue, 0.0)
        XCTAssertEqual(nSaturation, 100.0)
        XCTAssertEqual(nLightness, 100.0)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_lightness_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        let saturation: Float = 65.0
        let lightness: Float = 95.0
        
        // when
        let (nHue, nSaturation, nLightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(nHue, 0.0)
        XCTAssertEqual(nSaturation, saturation)
        XCTAssertEqual(nLightness, lightness)
    }
    
    func test_amazingColorHelpers_normalized_hue_saturation_lightness_whenAllValuesAreNormal() {
        // given
        let hue: Float = 350.0
        let saturation: Float = 65.0
        let lightness: Float = 95.0
        
        // when
        let (nHue, nSaturation, nLightness) = AmazingColorHelpers.shared.normalized(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(nHue, hue)
        XCTAssertEqual(nSaturation, saturation)
        XCTAssertEqual(nLightness, lightness)
    }
}
