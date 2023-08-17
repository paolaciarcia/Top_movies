//
//  UIColor+Ext.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

extension UIColor {
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var formattedHex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        formattedHex = formattedHex.replacingOccurrences(of: "#", with: "")

        var hexValue: UInt64 = 0

        guard Scanner(string: formattedHex).scanHexInt64(&hexValue) else {
            return nil
        }

        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hexValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
