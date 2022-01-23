//
//  AmazingHueHelpers.swift
//  
//
//  Created by Timur Khamidov on 23.01.2022.
//

private extension Float {
    
    // MARK: - Type Properties
    
    static let minHueValue: Float = 0.0
    
    static let maxHueValue: Float = 360.0
}

public final class AmazingHueHelpers: IAmazingHueHelpers {
    
    // MARK: - Type Properties
    
    public static let shared = AmazingHueHelpers()
    
    // MARK: - Initializers
    
    private init() { }
    
    // MARK: - IAmazingHueHelpers
    
    public func normalized(hue: Float) -> Float {
        var hue = hue.truncatingRemainder(dividingBy: .maxHueValue)
        
        if hue < .minHueValue {
            hue += .maxHueValue
        }
        
        return hue
    }
    
    public func rotated(hue: Float, degrees: Float) -> Float {
        normalized(hue: hue + degrees)
    }
    
    public func complementary(hue: Float) -> Float {
        rotated(hue: hue, degrees: 180.0)
    }
    
    public func splitComplementary(hue: Float) -> (Float, Float) {
        (
            rotated(hue: hue, degrees: -150.0),
            rotated(hue: hue, degrees: 150.0)
        )
    }
    
    public func triadic(hue: Float) -> (Float, Float) {
        (
            rotated(hue: hue, degrees: -120.0),
            rotated(hue: hue, degrees: 120.0)
        )
    }
    
    public func square(hue: Float) -> (Float, Float, Float) {
        (
            rotated(hue: hue, degrees: 90.0),
            rotated(hue: hue, degrees: 180.0),
            rotated(hue: hue, degrees: 270.0)
        )
    }
    
    public func rectangle(hue: Float) -> (Float, Float, Float) {
        (
            rotated(hue: hue, degrees: 120.0),
            rotated(hue: hue, degrees: 180.0),
            rotated(hue: hue, degrees: 300.0)
        )
    }
    
    public func analogus(hue: Float) -> (Float, Float) {
        (
            rotated(hue: hue, degrees: -30.0),
            rotated(hue: hue, degrees: 30.0)
        )
    }
}
