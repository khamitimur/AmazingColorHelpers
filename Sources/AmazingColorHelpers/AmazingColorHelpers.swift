//
//  AmazingColorHelpers.swift
//  
//
//  Created by Timur Khamidov on 13.01.2022
//
    
import Foundation

private extension Int {
    
    // MARK: - Type Properties
    
    static let minHueValue: Int = 0
    
    static let maxHueValue: Int = 360
    
    static let minSaturationValue: Int = 0
    
    static let maxSaturationValue: Int = 100
    
    static let minBrightnessValue: Int = 0
    
    static let maxBrightnessValue: Int = 100
    
    static let minLightnessValue: Int = 0
    
    static let maxLightnessValue: Int = 100
}

public protocol IAmazingColorHelpers: AnyObject {
    
    // MARK: - Methods
    
    /// Returns normalized HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func normalized(hue: Int, saturation: Int, brightness: Int) -> (hue: Int, saturation: Int, brightness: Int)
    
    /// Returns normalized HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - lightness: Lightness value in percents.
    func normalized(hue: Int, saturation: Int, lightness: Int) -> (hue: Int, saturation: Int, lightness: Int)
    
    /// Returns RGB color values from provided HSB color values.
    /// - Parameters:
    ///   - hue: Hue value in degrees.
    ///   - saturation: Saturation value in percents.
    ///   - brightness: Brightness value in percents.
    func rgb(hue: Int, saturation: Int, brightness: Int) -> (red: UInt8, green: UInt8, blue: UInt8)
    
    /// Returns HSB color values from provided RGB color values.
    /// - Parameters:
    ///   - red: Red component value.
    ///   - green: Green component value.
    ///   - blue: Blue component value.
    func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Int, saturation: Int, brightness: Int)
}

public final class AmazingColorHelpers: IAmazingColorHelpers {
    
    // MARK: - Type Properties
    
    public static let shared = AmazingColorHelpers()
    
    // MARK: - Initializers
    
    private init() { }
    
    // MARK: - IAmazingColorHelpers
    
    public func normalized(hue: Int, saturation: Int, brightness: Int) -> (hue: Int, saturation: Int, brightness: Int) {
        let hue = normalized(hue: hue)
        let saturation = normalized(saturation: saturation)
        let brightness = normalized(brightness: brightness)
        
        return (hue, saturation, brightness)
    }
    
    public func normalized(hue: Int, saturation: Int, lightness: Int) -> (hue: Int, saturation: Int, lightness: Int) {
        let hue = normalized(hue: hue)
        let saturation = normalized(saturation: saturation)
        let lightness = normalized(lightness: lightness)
        
        return (hue, saturation, lightness)
    }
    
    public func rgb(hue: Int, saturation: Int, brightness: Int) -> (red: UInt8, green: UInt8, blue: UInt8) {
        let (hue, saturation, brightness) = normalized(hue: hue, saturation: saturation, brightness: brightness)
        
        let hueF = Float(hue)
        let saturationF = Float(saturation) / 100.0
        let brightnessF = Float(brightness) / 100.0
        
        let C = brightnessF * saturationF
        let X = C * (1 - abs((hueF / 60.0).truncatingRemainder(dividingBy: 2.0) - 1))
        
        let m = brightnessF - C
        
        let r, g, b: Float
        
        if hue < 60 {
            r = C
            g = X
            b = 0.0
        } else if hue < 120 {
            r = X
            g = C
            b = 0.0
        } else if hue < 180 {
            r = 0.0
            g = C
            b = X
        } else if hue < 240 {
            r = 0.0
            g = X
            b = C
        } else if hue < 300 {
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
    
    public func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Int, saturation: Int, brightness: Int) {
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
        
        let hue = Int(round(h))
        let saturation = Int(round(s * 100))
        let brightness = Int(round(b * 100))
        
        return (hue, saturation, brightness)
    }
    
    // MARK: - Type Methods
    
    /// Returns normalized hue value in degrees from 0 to 360.
    /// - Parameter hue: Hue value in degrees.
    private func normalized(hue: Int) -> Int {
        if hue < .minHueValue {
            return .minHueValue
        }
        
        else if hue >= .maxHueValue {
            return .minHueValue
        }
        
        return hue
    }
    
    /// Returns normalized saturation value in percents from 0 to 100.
    /// - Parameter saturation: Saturation value in percents.
    private func normalized(saturation: Int) -> Int {
        if saturation < .minSaturationValue {
            return .minSaturationValue
        }
        
        else if saturation > .maxSaturationValue {
            return .maxSaturationValue
        }
        
        return saturation
    }
    
    /// Returns normalized brightness value in percents from 0 to 100.
    /// - Parameter brightness: Brightness value in percents.
    private func normalized(brightness: Int) -> Int {
        if brightness < .minBrightnessValue {
            return .minBrightnessValue
        }
        
        else if brightness > .maxBrightnessValue {
            return .maxBrightnessValue
        }
        
        return brightness
    }
    
    /// Returns normalized lightness value in percents from 0 to 100.
    /// - Parameter brightness: Lightness value in percents.
    private func normalized(lightness: Int) -> Int {
        if lightness < .minLightnessValue {
            return .minLightnessValue
        }
        
        else if lightness > .maxLightnessValue {
            return .maxLightnessValue
        }
        
        return lightness
    }
}
