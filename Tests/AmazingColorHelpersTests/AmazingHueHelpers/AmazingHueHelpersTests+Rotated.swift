//
//  AmazingHueHelpersTests+Rotated.swift
//
//
//  Created by Timur Khamidov on 20.01.2022.
//

import XCTest

@testable import AmazingColorHelpers

extension AmazingHueHelpersTests {

    // MARK: - Tests

    func test_amazingHueHelpers_rotated_whenHueAndDegreesSumIsNormal() {
        // given
        let hue: Float = 50.0
        let degrees: Float = 260.0

        // when
        let rHue = AmazingHueHelpers.shared.rotated(hue: hue, degrees: degrees)

        // then
        XCTAssertEqual(rHue, 310.0)
    }

    func test_amazingHueHelpers_rotated_whenHueAndDegreesSumIsLowerThanNormal() {
        // given
        let hue: Float = 123.0
        let degrees: Float = -200.0

        // when
        let rHue = AmazingHueHelpers.shared.rotated(hue: hue, degrees: degrees)

        // then
        XCTAssertEqual(rHue, 283.0)
    }

    func test_amazingHueHelpers_rotated_whenHueAndDegreesSumIsIsHigherThanNormal() {
        // given
        let hue: Float = 123.0
        let degrees: Float = 400.0

        // when
        let rHue = AmazingHueHelpers.shared.rotated(hue: hue, degrees: degrees)

        // then
        XCTAssertEqual(rHue, 163.0)
    }

    func test_amazingHueHelpers_rotated_whenHueAndDegreesSumIsEqualTo360Degrees() {
        // given
        let hue: Float = 100.0
        let degrees: Float = 260.0

        // when
        let rHue = AmazingHueHelpers.shared.rotated(hue: hue, degrees: degrees)

        // then
        XCTAssertEqual(rHue, 0.0)
    }
}
