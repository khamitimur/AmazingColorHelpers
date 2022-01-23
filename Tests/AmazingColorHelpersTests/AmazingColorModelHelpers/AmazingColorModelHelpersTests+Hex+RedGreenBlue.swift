//
//  AmazingColorModelHelpersTests+Hex+RedGreenBlue.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorModelHelpersTests {
    
    // MARK: - Tests
    
    func test_hex_red_green_blue() {
        // given
        let red: UInt8 = 237
        let green: UInt8 = 120
        let blue: UInt8 = 59
        
        // when
        let hex = AmazingColorModelHelpers.shared.hex(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(hex, "#ED783B")
    }
}
