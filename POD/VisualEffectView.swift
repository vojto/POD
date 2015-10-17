//
//  VisualEffectView.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class VisualEffectView: Component {
    override func createView() -> NSView {
        let view = NSVisualEffectView()
        
        return view
    }
}