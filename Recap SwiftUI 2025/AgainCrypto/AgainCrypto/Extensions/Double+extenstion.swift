//
//  Double+extenstion.swift
//  AgainCrypto
//
//  Created by Sajid Shanta on 23/6/25.
//
import Foundation

extension Double {
    ///Convert a double into BDT Currency with 2 decimal places
    ///```
    /// Convert 1234.56 to 1,234.56৳
    /// Convert 1234.1234567890 to 1,234.123456৳
    ///```
    private var bdCurrencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // default value
        formatter.currencyCode = "bdt" // change currency
        formatter.currencySymbol = "৳" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Convert a double into BDT Currency String with 2 decimal places
    ///```
    /// Convert 1234.56 to "1,234.56৳"
    /// Convert 1234.1234567890 to "1,234.123456৳"
    ///```
    func asBdCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return bdCurrencyFormatter.string(from: number) ?? "0.00৳"
    }
    
    ///Convert a double into String
    ///```
    /// Convert 34.567 to "34.56"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Convert a double into string with percent symbol
    ///```
    /// Convert 34.567 to "34.56%"
    ///```
    func asPercentString() -> String {
        return asNumberString()+"%"
    }
}
