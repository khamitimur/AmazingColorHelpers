//
//  AmazingColorHelpersTests+HSL+HueSaturationBrightness.swift
//  
//
//  Created by Timur Khamidov on 18.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_hsl_hue_saturation_brightness() {
        // given
        let hueB: Float = 140.456
        let saturationB: Float = 74.21
        let brightness: Float = 92.2
        
        // when
        let (hueL, saturationL, lightness) = AmazingColorHelpers.shared.hsl(
            hue: hueB,
            saturation: saturationB,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(hueL, hueB)
        XCTAssertEqual(saturationL, 81.43335)
        XCTAssertEqual(lightness, 57.989193)
    }
    
    func test_amazingColorHelpers_hsl_hue_saturation_brightness_whenAllValuesAreMin() {
        // given
        let hueB: Float = 0.0
        let saturationB: Float = 0.0
        let brightness: Float = 0.0
        
        // when
        let (hueL, saturationL, lightness) = AmazingColorHelpers.shared.hsl(
            hue: hueB,
            saturation: saturationB,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(hueL, 0.0)
        XCTAssertEqual(saturationL, 0.0)
        XCTAssertEqual(lightness, 0.0)
    }
    
    func test_amazingColorHelpers_hsl_hue_saturation_brightness_whenAllValuesAreMax() {
        // given
        let hueB: Float = 360.0
        let saturationB: Float = 100.0
        let brightness: Float = 100.0
        
        // when
        let (hueL, saturationL, lightness) = AmazingColorHelpers.shared.hsl(
            hue: hueB,
            saturation: saturationB,
            brightness: brightness
        )
        
        // then
        XCTAssertEqual(hueL, 0.0)
        XCTAssertEqual(saturationL, 100.0)
        XCTAssertEqual(lightness, 50.0)
    }
}
