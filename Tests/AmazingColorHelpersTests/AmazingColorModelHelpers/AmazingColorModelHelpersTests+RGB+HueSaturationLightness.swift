//
//  AmazingColorModelHelpersTests+RGB+HueSaturationLightness.swift
//  
//
//  Created by Тимур Хамидов on 16.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorModelHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan60Degrees() {
        // given
        let hue: Float = 34.5
        let saturation: Float = 75.2
        let lightness: Float = 56.8
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 228)
        XCTAssertEqual(green, 157)
        XCTAssertEqual(blue, 62)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan120Degrees() {
        // given
        let hue: Float = 104.2
        let saturation: Float = 98.0
        let lightness: Float = 65.8
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 127)
        XCTAssertEqual(green, 253)
        XCTAssertEqual(blue, 82)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan180Degrees() {
        // given
        let hue: Float = 178.0
        let saturation: Float = 67.0
        let lightness: Float = 98.8
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 250)
        XCTAssertEqual(green, 254)
        XCTAssertEqual(blue, 254)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan240Degrees() {
        // given
        let hue: Float = 202.5
        let saturation: Float = 87.9
        let lightness: Float = 48.0
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 15)
        XCTAssertEqual(green, 149)
        XCTAssertEqual(blue, 230)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan300Degrees() {
        // given
        let hue: Float = 274.0
        let saturation: Float = 57.1
        let lightness: Float = 78.6
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 205)
        XCTAssertEqual(green, 169)
        XCTAssertEqual(blue, 232)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsLowerThan360Degrees() {
        // given
        let hue: Float = 354.2
        let saturation: Float = 26.3
        let lightness: Float = 10.7
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 34)
        XCTAssertEqual(green, 20)
        XCTAssertEqual(blue, 21)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        let saturation: Float = 75.3
        let lightness: Float = 42.1
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 188)
        XCTAssertEqual(green, 27)
        XCTAssertEqual(blue, 27)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenAllValuesAreLowerThanNormal() {
        // given
        let hue: Float = -12.0
        let saturation: Float = -75.0
        let lightness: Float = -12.0
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
    }
    
    func test_amazingColorModelHelpers_rgb_hue_saturation_lightness_whenAllValuesAreHigherThanNormal() {
        // given
        let hue: Float = 412.0
        let saturation: Float = 175.0
        let lightness: Float = 112.0
        
        // when
        let (red, green, blue) = AmazingColorModelHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(red, 255)
        XCTAssertEqual(green, 255)
        XCTAssertEqual(blue, 255)
    }
}
