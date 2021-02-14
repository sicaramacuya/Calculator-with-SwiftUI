//
//  extensions.swift
//  Calculator with SwiftUI
//
//  Created by Eric Morales on 2/10/21.
//

import Foundation

// Adds subscript to string
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
