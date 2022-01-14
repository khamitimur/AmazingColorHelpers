//
//  AmazingColorHelpers.swift
//  
//
//  Created by Timur Khamidov on 13.01.2022
//
    
import Foundation

private extension Float {
    
    // MARK: - Type Properties
    
    static let minHueValue: Float = 0.0
    
    static let maxHueValue: Float = 360.0
    
    static let minSaturationValue: Float = 0.0
    
    static let maxSaturationValue: Float = 100.0
    
    static let minBrightnessValue: Float = 0.0
    
    static let maxBrightnessValue: Float = 100.0
    
    static let minLightnessValue: Float = 0.0
    
    static let maxLightnessValue: Float = 100.0
}

public protocol IAmazingColorHelpers: AnyObject {
    
    // MARK: - Methods
    
    /// Returns normalized HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func normalized(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, brightness: Float)
    
    /// Returns normalized HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    func normalized(hue: Float, saturation: Float, lightness: Float) -> (hue: Float, saturation: Float, lightness: Float)
    
    /// Returns RGB color values from provided HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func rgb(hue: Float, saturation: Float, brightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8)
    
    /// Returns HSB color values from provided RGB color values.
    /// - Parameters:
    ///   - red: Red component value.
    ///   - green: Green component value.
    ///   - blue: Blue component value.
    func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, brightness: Float)
}

public final class AmazingColorHelpers: IAmazingColorHelpers {
    
    // MARK: - Type Properties
    
    public static let shared = AmazingColorHelpers()
    
    // MARK: - Initializers
    
    private init() { }
    
    // MARK: - IAmazingColorHelpers
    
    public func normalized(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, brightness: Float) {
        let hue = normalized(hue: hue)
        let saturation = normalized(saturation: saturation)
        let brightness = normalized(brightness: brightness)
        
        return (hue, saturation, brightness)
    }
    
    public func normalized(hue: Float, saturation: Float, lightness: Float) -> (hue: Float, saturation: Float, lightness: Float) {
        let hue = normalized(hue: hue)
        let saturation = normalized(saturation: saturation)
        let lightness = normalized(lightness: lightness)
        
        return (hue, saturation, lightness)
    }
    
    public func rgb(hue: Float, saturation: Float, brightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8) {
        let (hue, saturation, brightness) = normalized(hue: hue, saturation: saturation, brightness: brightness)
        
        let hueF = hue
        let saturationF = saturation / 100.0
        let brightnessF = brightness / 100.0
        
        let C = brightnessF * saturationF
        let X = C * (1 - abs((hueF / 60.0).truncatingRemainder(dividingBy: 2.0) - 1))
        
        let m = brightnessF - C
        
        let r, g, b: Float
        
        if hue < 60.0 {
            r = C
            g = X
            b = 0.0
        } else if hue < 120.0 {
            r = X
            g = C
            b = 0.0
        } else if hue < 180.0 {
            r = 0.0
            g = C
            b = X
        } else if hue < 240.0 {
            r = 0.0
            g = X
            b = C
        } else if hue < 300.0 {
            r = X
            g = 0.0
            b = C
        } else {
            r = C
            g = 0.0
            b = X
        }
        
        let red = UInt8(round((r + m) * 255))
        let green = UInt8(round((g + m) * 255))
        let blue = UInt8(round((b + m) * 255))
        
        return (red, green, blue)
    }
    
    public func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, brightness: Float) {
        let redF = Float(red) / 255
        let greenF = Float(green) / 255
        let blueF = Float(blue) / 255
        
        let cMax = max(redF, max(greenF, blueF))
        let cMin = min(redF, min(greenF, blueF))
        
        let cDelta = cMax - cMin
        
        let h: Float
        let s: Float
        let b: Float = cMax
        
        if cDelta == 0.0 {
            h = 0.0
        } else if cMax == redF {
            h = 60 * ((greenF - blueF) / cDelta).truncatingRemainder(dividingBy: 6.0)
        } else if cMax == greenF {
            h = 60 * (((blueF - redF) / cDelta) + 2)
        } else {
            h = 60 * (((redF - greenF) / cDelta) + 4)
        }
        
        if cMax == 0.0 {
            s = 0.0
        } else {
            s = cDelta / cMax
        }
        
        let hue = h.rounded(1)
        let saturation = (s * 100).rounded(1)
        let brightness = (b * 100).rounded(1)
        
        return (hue, saturation, brightness)
    }
    
    // MARK: - Type Methods
    
    /// Returns normalized hue component value in degrees.
    /// - Parameter hue: Hue value in degrees.
    private func normalized(hue: Float) -> Float {
        if hue < .minHueValue {
            return .minHueValue
        }
        
        else if hue >= .maxHueValue {
            return .minHueValue
        }
        
        return hue
    }
    
    /// Returns normalized saturation component value in percents.
    /// - Parameter saturation: Saturation value in percents.
    private func normalized(saturation: Float) -> Float {
        if saturation < .minSaturationValue {
            return .minSaturationValue
        }
        
        else if saturation > .maxSaturationValue {
            return .maxSaturationValue
        }
        
        return saturation
    }
    
    /// Returns normalized brightness component value in percents from.
    /// - Parameter brightness: Brightness value in percents.
    private func normalized(brightness: Float) -> Float {
        if brightness < .minBrightnessValue {
            return .minBrightnessValue
        }
        
        else if brightness > .maxBrightnessValue {
            return .maxBrightnessValue
        }
        
        return brightness
    }
    
    /// Returns normalized lightness component value in percents from.
    /// - Parameter brightness: Lightness value in percents.
    private func normalized(lightness: Float) -> Float {
        if lightness < .minLightnessValue {
            return .minLightnessValue
        }
        
        else if lightness > .maxLightnessValue {
            return .maxLightnessValue
        }
        
        return lightness
    }
}
