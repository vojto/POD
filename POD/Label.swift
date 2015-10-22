//
//  Label.swift
//  POD
//
//  Created by Vojtech Rinik on 19/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

public class Label: Component {
    var label: String? = nil
    var isBold = false
    var font: NSFont?
    var alignment: NSTextAlignment?
    var color: NSColor?
    
    public init(label: String) {
        self.label = label
    }
    
    override func createView() -> NSView {
        let field = NSTextField()
        if label != nil {
            field.stringValue = label!
        }
        
        if isBold {
            // TODO: This is pretty bad way of doing things
            field.font = NSFont.boldSystemFontOfSize(12)
        }
        
        if font != nil {
            field.font = font!
        }
        
        if alignment != nil {
            field.alignment = alignment!
        }
        
        field.textColor = color
        
        field.editable = false
        field.selectable = false
        field.bordered = false
        field.backgroundColor = NSColor.clearColor()
        return field
    }
}