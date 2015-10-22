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
    override func render() -> [Component]? {
        let sidebar = Sidebar()
        sidebar.style.background = NSColor.fromHex("f0f0f4")
        sidebar.tag = "sidebar"
        
        let main = Component()
        main.style.background = NSColor.whiteColor()
        main.tag = "main"
        
        let split = SplitView()
        split.children = [sidebar, main]
        split.setSizeRange(0, range: [160, 200])
        
        split.layout <- layout
        
        return [split]
    }
}



