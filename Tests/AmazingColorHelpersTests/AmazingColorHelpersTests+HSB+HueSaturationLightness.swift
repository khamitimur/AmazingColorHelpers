//
//  AmazingColorHelpersTests+HSB+HueSaturationLightness.swift
//  
//
//  Created by Timur Khamidov on 16.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_hsb_hue_saturation_lightness() {
        // given
        let hueL: Float = 240.45
        let saturationL: Float = 54.21
        let lightness: Float = 62.8
        
        // when
        let (hueB, saturationB, brightness) = AmazingColorHelpers.shared.hsb(
            hue: hueL,
            saturation: saturationL,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(hueB, hueL)
        XCTAssertEqual(saturationB, 48.612904)
        XCTAssertEqual(brightness, 82.966125)
    }
    
    func test_amazingColorHelpers_hsb_hue_saturation_lightness_whenAllValuesAreMin() {
        // given
        let hueL: Float = 0.0
        let saturationL: Float = 0.0
        let lightness: Float = 0.0
        
        // when
        let (hueB, saturationB, brightness) = AmazingColorHelpers.shared.hsb(
            hue: hueL,
            saturation: saturationL,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(hueB, 0.0)
        XCTAssertEqual(saturationB, 0.0)
        XCTAssertEqual(brightness, 0.0)
    }
    
    func test_amazingColorHelpers_hsb_hue_saturation_lightness_whenAllValuesAreMax() {
        // given
        let hueL: Float = 360.0
        let saturationL: Float = 100.0
        let lightness: Float = 100.0
        
        // when
        let (hueB, saturationB, brightness) = AmazingColorHelpers.shared.hsb(
            hue: hueL,
            saturation: saturationL,
            lightness: lightness
        )
        
        // then
        XCTAssertEqual(hueB, 0.0)
        XCTAssertEqual(saturationB, 0.0)
        XCTAssertEqual(brightness, 100.0)
    }
}
