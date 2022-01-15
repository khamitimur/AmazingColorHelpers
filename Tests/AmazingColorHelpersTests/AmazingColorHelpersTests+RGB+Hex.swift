//
//  AmazingColorHelpersTests+RGB+Hex.swift
//  
//
//  Created by Тимур Хамидов on 15.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorHelpers_rgb_hex() {
        // given
        let hex: String = "01006A"
        
        // when
        let color = AmazingColorHelpers.shared.rgb(hex: hex)
        
        // then
        XCTAssertNotNil(color)
        
        XCTAssertEqual(color!.red, 1)
        XCTAssertEqual(color!.green, 0)
        XCTAssertEqual(color!.blue, 106)
    }
    
    func test_amazingColorHelpers_rgb_hex_whenHexStartsWithOctothorpe() {
        // given
        let hex: String = "#E735D5"
        
        // when
        let color = AmazingColorHelpers.shared.rgb(hex: hex)
        
        // then
        XCTAssertNotNil(color)
        
        XCTAssertEqual(color!.red, 231)
        XCTAssertEqual(color!.green, 53)
        XCTAssertEqual(color!.blue, 213)
    }
    
    func test_amazingColorHelpers_rgb_hex_whenHexIsNotValidString() {
        // given
        let hex: String = "абвсна"
        
        // when
        let color = AmazingColorHelpers.shared.rgb(hex: hex)
        
        // then
        XCTAssertNil(color)
    }
    
    func test_amazingColorHelpers_rgb_hex_whenHexIsLowerThan6DigitsCount() {
        // given
        let hex: String = "735D5"
        
        // when
        let color = AmazingColorHelpers.shared.rgb(hex: hex)
        
        // then
        XCTAssertNil(color)
    }
    
    func test_amazingColorHelpers_rgb_hex_whenHexIsLowerThan6DigitsCount_whenHexStartsWithOctothorpe() {
        // given
        let hex: String = "#735D5"
        
        // when
        let color = AmazingColorHelpers.shared.rgb(hex: hex)
        
        // then
        XCTAssertNil(color)
    }
}
