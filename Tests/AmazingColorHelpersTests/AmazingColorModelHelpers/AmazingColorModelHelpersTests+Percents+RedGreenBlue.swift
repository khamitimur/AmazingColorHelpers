//
//  AmazingColorModelHelpersTests+Percents+RedGreenBlue.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingColorModelHelpersTests {
    
    // MARK: - Tests
    
    func test_amazingColorModelHelpers_percents_red_green_blue() {
        // given
        let red: UInt8 = 234
        let green: UInt8 = 127
        let blue: UInt8 = 96
        
        // when
        let (pRed, pGreen, pBlue) = AmazingColorModelHelpers.shared.percents(
            red: red,
            green: green,
            blue: blue
        )
        
        // then
        XCTAssertEqual(pRed, 0.91764706)
        XCTAssertEqual(pGreen, 0.49803922)
        XCTAssertEqual(pBlue, 0.3764706)
    }
}
