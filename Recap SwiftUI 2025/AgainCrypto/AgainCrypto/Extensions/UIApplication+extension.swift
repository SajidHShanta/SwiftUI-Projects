//
//  UIApplication+extension.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 30/6/25.
//
import SwiftUI

extension UIApplication {
    
    /// hide keybord
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
