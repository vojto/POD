//
//  Button.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Button: Component {
    let title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
    
    override func createView() -> NSView {
        let view = NSButton()
        if let title = title {
            view.title = title
        }
        return view
    }
}