//
//  NSColor+Extensions.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

// Taken from: https://github.com/pketh/NSColor-fromHex-Swift/blob/master/NSColor%2BfromHex.swift
extension NSColor {
    class func fromHex(hexColor: String) -> NSColor {
        var hex = String()
        if hexColor.hasPrefix("#") {
            hex = hexColor[1]
        } else {
            hex = hexColor
        }
        
        func hexToCGFloat(color: String) -> CGFloat {
            var result: CUnsignedInt = 0
            let scanner: NSScanner = NSScanner(string: color)
            scanner.scanHexInt(&result)
            let colorValue: CGFloat = CGFloat(result)
            return colorValue / 255
        }
        
        let redComponent = hexToCGFloat(hex[0...1]),
        greenComponent = hexToCGFloat(hex[2...3]),
        blueComponent = hexToCGFloat(hex[4...5])
        
        let color = NSColor(calibratedRed: redComponent, green: greenComponent, blue: blueComponent, alpha: 1)
        
        return color
    }
}

extension String {
    subscript (i: Int) -> String {
        return String(Array(arrayLiteral: self)[i])
    }
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = startIndex.advancedBy(r.endIndex)
        return substringWithRange(Range(start: start, end: end))
    }
}