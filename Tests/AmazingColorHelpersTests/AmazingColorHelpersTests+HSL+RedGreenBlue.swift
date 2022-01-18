//
//  AmazingColorHelpersTests+HSL+RedGreenBlue.swift
//  
//
//  Created by Тимур Хамидов on 15.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_hsl_red_green_blue_whenRedIsHighestValue() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 32
        let blue: UInt8 = 200
        
        // when
        let (hue, saturation, lightness) = AmazingColorHelpers.shared.hsl(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 314.79822)
        XCTAssertEqual(saturation, 100.0)
        XCTAssertEqual(lightness, 56.27451)
    }
    
    func test_amazingColorHelpers_hsl_red_green_blue_whenGreenIsHighestValue() {
        // given
        let red: UInt8 = 120
        let green: UInt8 = 220
        let blue: UInt8 = 200
        
        // when
        let (hue, saturation, lightness) = AmazingColorHelpers.shared.hsl(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 168.0)
        XCTAssertEqual(saturation, 58.823532)
        XCTAssertEqual(lightness, 66.66667)
    }
    
    func test_amazingColorHelpers_hsl_red_green_blue_whenBlueIsHighestValue() {
        // given
        let red: UInt8 = 120
        let green: UInt8 = 64
        let blue: UInt8 = 123
        
        // when
        let (hue, saturation, lightness) = AmazingColorHelpers.shared.hsl(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 296.94916)
        XCTAssertEqual(saturation, 31.5508)
        XCTAssertEqual(lightness, 36.666668)
    }
    
    func test_amazingColorHelpers_hsl_red_green_blue_whenAllValuesAreEqualTo0() {
        // given
        let red: UInt8 = 0
        let green: UInt8 = 0
        let blue: UInt8 = 0
        
        // when
        let (hue, saturation, lightness) = AmazingColorHelpers.shared.hsl(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0.0)
        XCTAssertEqual(saturation, 0.0)
        XCTAssertEqual(lightness, 0.0)
    }
    
    func test_amazingColorHelpers_hsl_red_green_blue_whenAllValuesAreEqualTo255() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 255
        let blue: UInt8 = 255
        
        // when
        let (hue, saturation, lightness) = AmazingColorHelpers.shared.hsl(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0.0)
        XCTAssertEqual(saturation, 0.0)
        XCTAssertEqual(lightness, 100.0)
    }
}
