//
//  Float+AmazingColorHelpers.swift
//  
//
//  Created by Timur Khamidov on 14.01.2022.
//

import Foundation

extension Float {
    
    // MARK: - Methods
    
    /// Returns a rounded value.
    /// - Parameter fraction: Number of digits in a fraction part of a rounded value.
    func rounded(_ precision: Int) -> Float {
        let multiplier = pow(10.0, Float(precision))
        
        return (self * multiplier).rounded() / multiplier
    }
}
