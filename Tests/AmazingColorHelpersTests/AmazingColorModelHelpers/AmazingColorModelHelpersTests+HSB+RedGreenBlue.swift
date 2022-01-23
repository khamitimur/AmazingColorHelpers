//
//  AmazingColorModelHelpersTests+HSB+RedGreenBlue.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorModelHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorModelHelpers_hsb_red_green_blue_whenRedIsHighestValue() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 32
        let blue: UInt8 = 200
        
        // when
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 314.79822)
        XCTAssertEqual(saturation, 87.45098)
        XCTAssertEqual(brightness, 100.00)
    }
    
    func test_amazingColorModelHelpers_hsb_red_green_blue_whenGreenIsHighestValue() {
        // given
        let red: UInt8 = 25
        let green: UInt8 = 220
        let blue: UInt8 = 98
        
        // when
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 142.46153)
        XCTAssertEqual(saturation, 88.63636)
        XCTAssertEqual(brightness, 86.27451)
    }
    
    func test_amazingColorModelHelpers_hsb_red_green_blue_whenBlueIsHighestValue() {
        // given
        let red: UInt8 = 65
        let green: UInt8 = 20
        let blue: UInt8 = 123
        
        // when
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 266.21362)
        XCTAssertEqual(saturation, 83.73984)
        XCTAssertEqual(brightness, 48.235294)
    }
    
    func test_amazingColorModelHelpers_hsb_red_green_blue_whenAllValuesAreEqualTo0() {
        // given
        let red: UInt8 = 0
        let green: UInt8 = 0
        let blue: UInt8 = 0
        
        // when
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0.0)
        XCTAssertEqual(saturation, 0.0)
        XCTAssertEqual(brightness, 0.0)
    }
    
    func test_amazingColorModelHelpers_hsb_red_green_blue_whenAllValuesAreEqualTo255() {
        // given
        let red: UInt8 = 255
        let green: UInt8 = 255
        let blue: UInt8 = 255
        
        // when
        let (hue, saturation, brightness) = AmazingColorModelHelpers.shared.hsb(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hue, 0.0)
        XCTAssertEqual(saturation, 0.0)
        XCTAssertEqual(brightness, 100.0)
    }
}
