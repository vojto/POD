//
//  MainComponent.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class MainComponent: Component {
    override func render() -> [Component] {
        let sidebar = Component()
        sidebar.style.background = NSColor.fromHex("f0f0f4")
        
        let main = Component()
        main.style.background = NSColor.whiteColor()
        
        let split = SplitView(subviews: [sidebar, main])
        split.setSizeRange(0, range: [150, 300])
        
        // TODO: Come up with a nice oneliner for this
        split.layout.left <- layout.left
        split.layout.right <- layout.right
        split.layout.top <- layout.top
        split.layout.bottom <- layout.bottom
        
        return [split]
    }
}
