//
//  IAmazingHueHelpers.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

public protocol IAmazingHueHelpers: AnyObject {
    
    // MARK: - Methods
    
    /// Returns normalized hue value in degrees.
    ///
    /// Hue value that is lower than `0` or higher than `360` degrees will be treated like a number of full rotations on a values circle.
    /// Sign of the provided value will determine direction of this rotation. Positive sign stands for clockwise rotation and negative for counter clockwise.
    ///
    /// Normalized hue value will be in the range from `0` to `359` degrees.
    ///
    /// ````
    /// let h1 = normalized(hue: 450.0)
    /// // h1 == 90.0
    ///
    /// let h2 = normalized(hue: -300.0)
    /// // h2 == 60.0
    ///
    /// let h3 = normalized(hue: 300.0)
    /// // h3 == 300.0
    /// ````
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func normalized(hue: Float) -> Float
    
    /// Returns rotated hue value in degrees.
    ///
    /// ````
    /// let h1 = rotated(hue: 300.0, degrees: 45.0)
    /// // h1 == 345.0
    ///
    /// let h2 = rotated(hue: 100.0, degrees: -145.0)
    /// // h2 == 315.0
    ///
    /// let h3 = rotated(hue: 200.0, degrees: 200.0)
    /// // h3 == 40.0
    /// ````
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - degrees: Number of degrees to rotate hue value.
    func rotated(hue: Float, degrees: Float) -> Float
    
    /// Returns complementary hue value in percents.
    ///
    /// Complementary hue value is calculated by rotating provided hue value by `180` degrees.
    ///
    /// ````
    /// let h1 = complementary(hue: 100.0)
    /// // h1 == 280.0
    ///
    /// let h2 = complementary(hue: 300.0)
    /// // h2 == 120.0
    ///
    /// let h3 = complementary(hue: 360.0)
    /// // h3 == 180.0
    /// ````
    ///
    /// [What Are Complementary Colors?](https://www.color-meanings.com/complementary-colors)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func complementary(hue: Float) -> Float
    
    /// Returns split-complementary hue values in percents.
    ///
    /// Split-Complementary hue values are calculated by rotating hue value by `-150` and `150` degrees.
    ///
    /// ````
    /// let (h1, h2) = splitComplementary(hue: 100.0)
    /// // h1 == 310.0
    /// // h2 == 250.0
    /// ````
    ///
    /// [What Are Split-Complementary Colors?](https://www.color-meanings.com/split-complementary-colors)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func splitComplementary(hue: Float) -> (Float, Float)
    
    /// Returns triadic hue values in percents.
    ///
    /// Triadic hue values are calculated by rotating hue value by `-120` and `120` degrees.
    ///
    /// ````
    /// let (h1, h2) = triadic(hue: 120.0)
    /// // h1 == 0.0
    /// // h2 == 240.0
    /// ````
    /// [What Are Triadic Colors?](https://www.color-meanings.com/triadic-colors)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func triadic(hue: Float) -> (Float, Float)
    
    /// Returns square hue values in percents.
    ///
    /// Square hue values are calculated by rotating hue value by `90`, `180` and `270` degrees.
    ///
    /// ````
    /// let (h1, h2, h3) = square(hue: 110.0)
    /// // h1 == 200.0
    /// // h2 == 290.0
    /// // h3 == 20.0
    /// ````
    /// [What Are Square Colors?](https://www.color-meanings.com/square-color-schemes)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func square(hue: Float) -> (Float, Float, Float)
    
    /// Returns rectangle hue values in percents.
    ///
    /// Rectangle hue values are calculated by rotating hue value by `120`, `180` and `300` degrees.
    ///
    /// ````
    /// let (h1, h2, h3) = rectangle(hue: 90.0)
    /// // h1 == 210.0
    /// // h2 == 270.0
    /// // h3 == 30.0
    /// ````
    /// [What Are Rectangle Colors?](https://www.color-meanings.com/rectangular-tetradic-color-schemes)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func rectangle(hue: Float) -> (Float, Float, Float)
    
    /// Returns analogous hue values in percents.
    ///
    /// Analogous hue values are calculated by rotating hue value by `-30` and `30` degrees.
    ///
    /// ````
    /// let (h1, h2) = analogus(hue: 10.0)
    /// // h1 == 340.0
    /// // h2 == 40.0
    /// ````
    /// [What Are Analogous Colors?](https://www.color-meanings.com/analogous-colors)
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    func analogus(hue: Float) -> (Float, Float)
}
