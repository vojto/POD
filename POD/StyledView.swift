//
//  StyledView.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class StyledView: NSView {
    var background: NSColor?
    
    override func drawRect(dirtyRect: NSRect) {
        if let b = background {
            b.set()
            NSRectFill(self.bounds)
        }
    }
}