//
//  Float+AmazingColorHelpers.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import Foundation

extension Float {
    
    // MARK: - Methods
    
    /// Return rounded value.
    /// - Parameter fraction: Number of digits in fraction.
    func rounded(_ fraction: Int) -> Float {
        let multiplier = pow(10.0, Float(fraction))
        
        return (self * multiplier).rounded() / multiplier
    }
}
