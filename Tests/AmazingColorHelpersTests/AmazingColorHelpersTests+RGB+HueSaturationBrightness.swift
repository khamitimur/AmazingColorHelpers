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
        let hue = 34
        let saturation = 75
        let brightness = 12
        
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
        let hue = 104
        let saturation = 98
        let brightness = 65
        
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
        let hue = 178
        let saturation = 67
        let brightness = 98
        
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
        let hue = 202
        let saturation = 87
        let brightness = 48
        
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
        let hue = 294
        let saturation = 57
        let brightness = 58
        
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
        let hue = 354
        let saturation = 16
        let brightness = 100
        
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
        let hue = 360
        let saturation = 75
        let brightness = 12
        
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
        let hue = -12
        let saturation = -75
        let brightness = -12
        
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
        let hue = 412
        let saturation = 175
        let brightness = 112
        
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
