//
//  Label.swift
//  POD
//
//  Created by Vojtech Rinik on 19/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Label: Component {
    let label: String
    
    init(label: String) {
        self.label = label
    }
    
    override func createView() -> NSView {
        let field = NSTextField()
        field.stringValue = label
        field.editable = false
        field.selectable = false
        field.bordered = false
        field.backgroundColor = NSColor.clearColor()
        return field
    }
}