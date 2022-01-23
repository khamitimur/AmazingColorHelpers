//
//  AmazingColorModelHelpers.swift
//  
//
//  Created by Timur Khamidov on 13.01.2022
//

import Foundation

private extension Float {
    
    // MARK: - Type Properties
    
    static let minPercentsValue: Float = 0.0
    
    static let maxPercentsValue: Float = 100.0
}

public final class AmazingColorModelHelpers: IAmazingColorModelHelpers {
    
    // MARK: - Type Properties
    
    public static let shared = AmazingColorModelHelpers()
    
    // MARK: - Initializers
    
    private init() { }
    
    // MARK: - IAmazingColorModelHelpers
    
    public func normalized(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, brightness: Float) {
        let hue = AmazingHueHelpers.shared.normalized(hue: hue)
        let saturation = normalized(percents: saturation)
        let brightness = normalized(percents: brightness)
        
        return (hue, saturation, brightness)
    }
    
    public func normalized(hue: Float, saturation: Float, lightness: Float) -> (hue: Float, saturation: Float, lightness: Float) {
        let hue = AmazingHueHelpers.shared.normalized(hue: hue)
        let saturation = normalized(percents: saturation)
        let lightness = normalized(percents: lightness)
        
        return (hue, saturation, lightness)
    }
    
    public func percents(red: UInt8, green: UInt8, blue: UInt8) -> (red: Float, green: Float, blue: Float) {
        let redF = Float(red) / 255
        let greenF = Float(green) / 255
        let blueF = Float(blue) / 255
        
        return (redF, greenF, blueF)
    }
    
    public func rgb(hex: String) -> (red: UInt8, green: UInt8, blue: UInt8)? {
        var hexString = hex
        
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        guard hexString.count == 6 else {
            return nil
        }
        
        let scanner = Scanner(string: hexString)
        
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }
        
        let r = (hexNumber & 0xFF0000) >> 16
        let g = (hexNumber & 0x00FF00) >> 8
        let b = hexNumber & 0x0000FF
        
        let red = UInt8(r)
        let green = UInt8(g)
        let blue = UInt8(b)
        
        return (red, green, blue)
    }
    
    public func rgb(hue: Float, saturation: Float, brightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8) {
        let (hue, saturation, brightness) = normalized(hue: hue, saturation: saturation, brightness: brightness)
        
        let saturationF = saturation / 100.0
        let brightnessF = brightness / 100.0
        
        let C = brightnessF * saturationF
        let X = C * (1 - abs((hue / 60.0).truncatingRemainder(dividingBy: 2.0) - 1))
        
        let m = brightnessF - C
        
        return rgb(hue: hue, C: C, X: X, m: m)
    }
    
    public func rgb(hue: Float, saturation: Float, lightness: Float) -> (red: UInt8, green: UInt8, blue: UInt8) {
        let (hue, saturation, lightness) = normalized(hue: hue, saturation: saturation, lightness: lightness)
        
        let saturationF = saturation / 100.0
        let lightnessF = lightness / 100.0
        
        let C = (1 - abs(2 * lightnessF - 1)) * saturationF
        let X = C * (1 - abs((hue / 60.0).truncatingRemainder(dividingBy: 2.0) - 1))
        
        let m = lightnessF - C / 2
        
        return rgb(hue: hue, C: C, X: X, m: m)
    }
    
    public func hsb(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, brightness: Float) {
        let (redF, greenF, blueF) = percents(red: red, green: green, blue: blue)
        let (cMax, _, cDelta) = cValues(red: redF, green: greenF, blue: blueF)
        
        let h: Float = hue(red: redF, green: greenF, blue: blueF, cMax: cMax, cDelta: cDelta)
        var s: Float
        var b: Float = cMax
        
        if cMax == 0.0 {
            s = 0.0
        } else {
            s = cDelta / cMax
        }
        
        s = (s * 100.0)
        b = (b * 100.0)
        
        return (h, s, b)
    }
    
    public func hsb(hue: Float, saturation: Float, lightness: Float)  -> (hue: Float, saturation: Float, brightness: Float) {
        let (hue, saturation, lightness) = normalized(hue: hue, saturation: saturation, lightness: lightness)
        
        let saturationF = saturation / 100.0
        let lightnessF = lightness / 100.0
        
        let h: Float = hue
        var s: Float
        var b: Float = lightnessF + (saturationF * min(lightnessF, 1 - lightnessF))
        
        if b == 0.0 {
            s = 0.0
        } else {
            s = 2 * (1 - (lightnessF / b))
        }
        
        s *= 100.0
        b *= 100.0
        
        return (h, s, b)
    }
    
    public func hsl(red: UInt8, green: UInt8, blue: UInt8) -> (hue: Float, saturation: Float, lightness: Float) {
        let (redF, greenF, blueF) = percents(red: red, green: green, blue: blue)
        let (cMax, cMin, cDelta) = cValues(red: redF, green: greenF, blue: blueF)
        
        let h: Float = hue(red: redF, green: greenF, blue: blueF, cMax: cMax, cDelta: cDelta)
        var s: Float
        var l: Float = (cMax + cMin) / 2
        
        if cDelta == 0.0 {
            s = 0.0
        } else {
            s = cDelta / (1 - abs(2 * l - 1))
        }
        
        s = (s * 100.0)
        l = (l * 100.0)
        
        return (h, s, l)
    }
    
    public func hsl(hue: Float, saturation: Float, brightness: Float) -> (hue: Float, saturation: Float, lightness: Float) {
        let (hue, saturation, brightness) = normalized(hue: hue, saturation: saturation, brightness: brightness)
        
        let saturationF = saturation / 100.0
        let brightnessF = brightness / 100.0
        
        let h: Float = hue
        var s: Float
        var l: Float = brightnessF * (1.0 - saturationF / 2.0)
        
        if l == 0.0 || l == 1.0 {
            s = 0.0
        } else {
            s = (brightnessF - l) / min(l, 1.0 - l)
        }
        
        s *= 100.0
        l *= 100.0
        
        return (h, s, l)
    }
    
    // MARK: - Private Methods
    
    /// Returns normalized percents value.
    private func normalized(percents: Float) -> Float {
        if percents < .minPercentsValue {
            return .minPercentsValue
        }
        
        else if percents > .maxPercentsValue {
            return .maxPercentsValue
        }
        
        return percents
    }
    
    /// Returns values needed for RGB color model values transformation to HSB/HSL color models.
    private func cValues(red: Float, green: Float, blue: Float) -> (cMax: Float, cMin: Float, cDelta: Float) {
        let cMax = max(red, max(green, blue))
        let cMin = min(red, min(green, blue))
        
        let cDelta = cMax - cMin
        
        return (cMax, cMin, cDelta)
    }
    
    /// Returns hue value transformed from the provided RGB color model values and their relations.
    private func hue(red: Float, green: Float, blue: Float, cMax: Float, cDelta: Float) -> Float {
        var hue: Float
        
        if cDelta == 0.0 {
            hue = 0.0
        } else if cMax == red {
            hue = ((green - blue) / cDelta).truncatingRemainder(dividingBy: 6.0)
        } else if cMax == green {
            hue = (((blue - red) / cDelta) + 2)
        } else {
            hue = (((red - green) / cDelta) + 4)
        }
        
        hue *= 60
        
        if hue < 0.0 {
            hue += 360.0
        }
        
        return hue
    }
    
    /// Returns RGB color model values tranformed from the provided HSB/HSL color model values and their relations.
    private func rgb(hue: Float, C: Float, X: Float, m: Float) -> (red: UInt8, green: UInt8, blue: UInt8) {
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
}
