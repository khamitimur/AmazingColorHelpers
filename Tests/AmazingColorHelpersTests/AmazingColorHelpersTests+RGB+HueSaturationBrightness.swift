//
//  AmazingColorHelpersTests+RGB+HueSaturationBrightness.swift
//
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan60Degrees() {
        // given
        let hue: Float = 34.0
        let saturation: Float = 75.0
        let brightness: Float = 12.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 31)
        XCTAssertEqual(green, 21)
        XCTAssertEqual(blue, 8)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan120Degrees() {
        // given
        let hue: Float = 104.0
        let saturation: Float = 98.0
        let brightness: Float = 65.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 47)
        XCTAssertEqual(green, 166)
        XCTAssertEqual(blue, 3)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan180Degrees() {
        // given
        let hue: Float = 178.0
        let saturation: Float = 67.0
        let brightness: Float = 98.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 82)
        XCTAssertEqual(green, 250)
        XCTAssertEqual(blue, 244)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan240Degrees() {
        // given
        let hue: Float = 202.0
        let saturation: Float = 87.0
        let brightness: Float = 48.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 16)
        XCTAssertEqual(green, 83)
        XCTAssertEqual(blue, 122)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan300Degrees() {
        // given
        let hue: Float = 294.0
        let saturation: Float = 57.0
        let brightness: Float = 58.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 139)
        XCTAssertEqual(green, 64)
        XCTAssertEqual(blue, 148)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsLowerThan360Degrees() {
        // given
        let hue: Float = 354.0
        let saturation: Float = 16.0
        let brightness: Float = 100.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 255)
        XCTAssertEqual(green, 214)
        XCTAssertEqual(blue, 218)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenHueIsEqualTo360Degrees() {
        // given
        let hue: Float = 360.0
        let saturation: Float = 75.0
        let brightness: Float = 12.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 31)
        XCTAssertEqual(green, 8)
        XCTAssertEqual(blue, 8)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenAllValuesAreLowerThanNormal() {
        // given
        let hue: Float = -12.0
        let saturation: Float = -75.0
        let brightness: Float = -12.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
    }
    
    func test_amazingColorHelpers_rgb_hue_saturation_brightness_whenAllValuesAreHigherThanNormal() {
        // given
        let hue: Float = 412.0
        let saturation: Float = 175.0
        let brightness: Float = 112.0
        
        // when
        let (red, green, blue) = AmazingColorHelpers.shared.rgb(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(red, 255)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
    }
}
