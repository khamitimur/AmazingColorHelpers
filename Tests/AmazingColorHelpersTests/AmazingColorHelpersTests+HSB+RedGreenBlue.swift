//
//  AmazingColorHelpersTests+HSB+RedGreenBlue.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_hsb_red_green_blue_whenRedIsHighestValue() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 120
        let blue: UInt8 = 12
        
        // when
        let (hue, saturation, brightness) = AmazingColorHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 27)
        XCTAssertEqual(saturation, 95)
        XCTAssertEqual(brightness, 100)
    }
    
    func test_amazingColorHelpers_hsb_red_green_blue_whenGreenIsHighestValue() {
        // given
        let red: UInt8 = 25
        let green: UInt8 = 220
        let blue: UInt8 = 97
        
        // when
        let (hue, saturation, brightness) = AmazingColorHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 142)
        XCTAssertEqual(saturation, 89)
        XCTAssertEqual(brightness, 86)
    }
    
    func test_amazingColorHelpers_hsb_red_green_blue_whenBlueIsHighestValue() {
        // given
        let red: UInt8 = 65
        let green: UInt8 = 20
        let blue: UInt8 = 123
        
        // when
        let (hue, saturation, brightness) = AmazingColorHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 266)
        XCTAssertEqual(saturation, 84)
        XCTAssertEqual(brightness, 48)
    }
    
    func test_amazingColorHelpers_hsb_red_green_blue_whenAllValuesAreEqualTo0() {
        // given
        let red: UInt8 = 0
        let green: UInt8 = 0
        let blue: UInt8 = 0
        
        // when
        let (hue, saturation, brightness) = AmazingColorHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0)
        XCTAssertEqual(saturation, 0)
        XCTAssertEqual(brightness, 0)
    }
    
    func test_amazingColorHelpers_hsb_red_green_blue_whenAllValuesAreEqualTo255() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 255
        let blue: UInt8 = 255
        
        // when
        let (hue, saturation, brightness) = AmazingColorHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0)
        XCTAssertEqual(saturation, 0)
        XCTAssertEqual(brightness, 100)
    }
}
