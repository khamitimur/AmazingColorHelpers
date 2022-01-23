//
//  IAmazingColorModelHelpers.swift
//  
//
//  Created by Timur Khamidov on 21.01.2022.
//

public protocol IAmazingColorModelHelpers: AnyObject {
    
    // MARK: - Methods
    
    /// Returns normalized HSB color model values.
    ///
    /// Hue value that is lower than `0` or higher than `360` degrees will be treated like a number of full rotations on a values circle.
    /// Sign of the provided value will determine direction of this rotation. Positive sign stands for clockwise rotation and negative for counter clockwise.
    ///
    /// Normalized hue value will be in the range from `0` to `359` degrees.
    ///
    /// Normalized saturation and brightness values will be in the range from `0` to `100` percents.
    ///
    /// ````
    /// let (h1, s1, b1) = normalized(hue: 450.0, saturation: 180, brightness: 150)
    /// // h1 == 90.0
    /// // s1 == 100.0
    /// // b1 == 100.0
    ///
    /// let (h2, s2, b2) = normalized(hue: -300.0, saturation: -80, brightness: -50)
    /// // h2 == 60.0
    /// // s2 == 0.0
    /// // b2 == 0.0
    ///
    /// let (h3, s3, b3) = normalized(hue: 300.0, saturation: 80, brightness: 50)
    /// // h3 == 300.0
    /// // s3 == 80.0
    /// // b3 == 50.0
    /// ````
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func normalized(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, brightness: Float)
    
    /// Returns normalized HSL color model values.
    ///
    /// Hue value that is lower than `0` or higher than `360` degrees will be treated like a number of full rotations on a values circle.
    /// Sign of the provided value will determine direction of this rotation. Positive sign stands for clockwise rotation and negative for counter clockwise.
    ///
    /// Normalized hue value will be in the range from `0` to `359` degrees.
    ///
    /// Normalized saturation and lightness values will be in the range from `0` to `100` percents.
    ///
    /// ````
    /// let (h1, s1, l1) = normalized(hue: 450.0, saturation: 180, lightness: 150)
    /// // h1 == 90.0
    /// // s1 == 100.0
    /// // l1 == 100.0
    ///
    /// let (h2, s2, l2) = normalized(hue: -300.0, saturation: -80, lightness: -50)
    /// // h2 == 60.0
    /// // s2 == 0.0
    /// // l2 == 0.0
    ///
    /// let (h3, s3, l3) = normalized(hue: 300.0, saturation: 80, lightness: 50)
    /// // h3 == 300.0
    /// // s3 == 80.0
    /// // l3 == 50.0
    /// ````
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    func normalized(hue: Float, saturation: Float, lightness: Float) -> (hue: Float, saturation: Float, lightness: Float)
    
    /// Returns RGB color model values represented in percents from their max values.
    ///
    /// RGB color model values represented in percents are in the range from `0.0` to `1.0`.
    /// - Parameters:
    ///   - red: Red value.
    ///   - green: Green value.
    ///   - blue: Blue value.
    func percents(red: UInt8, green: UInt8, blue: UInt8) -> (red: Float, green: Float, blue: Float)
    
    /// Returns hex triplet color representation transformed from the given RGB color model values.
    ///
    /// Hex triplet color representation will start with octothorp symbol.
    func hex(red: UInt8, green: UInt8, blue: UInt8) -> String
    
    /// Returns RGB color model values transformed from the given hex triplet color representation.
    ///
    /// Returns `nil` if  the given hex triplet color representation is not valid.
    /// - Parameters:
    ///   - hex: Hex triplet color representation.
    func rgb(hex: String) -> (red: UInt8, green: UInt8, blue: UInt8)?
    
    /// Returns RGB color model values transformed from the given HSB color model values.
    ///
    /// ``normalized(hue:saturation:brightness:)`` will be called before transformation to avoid optinal return type.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func rgb(hue: Float, saturation: Float, brightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8)
    
    /// Returns RGB color model values transformed from the given HSL color model values.
    ///
    /// ``normalized(hue:saturation:lightness:)`` will be called before transformation to avoid optinal return type.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    func rgb(hue: Float, saturation: Float, lightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8)
    
    /// Returns HSB color model values transformed from the given RGB color model values.
    /// - Parameters:
    ///   - red: Red value.
    ///   - green: Green value.
    ///   - blue: Blue value.
    func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, brightness: Float)
    
    /// Returns HSB color model values transformed from the given HSL color model values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    func hsb(hue: Float, saturation: Float, lightness: Float) -> (hue: Float, saturation: Float, brightness: Float)
    
    /// Returns HSL color model values transformed from given RGB color model values.
    /// - Parameters:
    ///   - red: Red value.
    ///   - green: Green value.
    ///   - blue: Blue value.
    func hsl(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, lightness: Float)
    
    /// Returns HSL color model values transformed from given HSB color model values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func hsl(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, lightness: Float)
}
