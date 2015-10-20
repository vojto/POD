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
        let sidebar = SidebarComponent()
        sidebar.style.background = NSColor.fromHex("f0f0f4")
        sidebar.tag = "sidebar"
        
        let main = Component()
        main.style.background = NSColor.whiteColor()
        main.tag = "main"
        
        let split = SplitView()
        split.children = [sidebar, main]
        split.setSizeRange(0, range: [150, 300])
        
        split.layout <- layout
        
        return [split]
    }
}

class SidebarComponent: Component {
    override func render() -> [Component]? {
        let table = TableComponent()
        
        table.layout <- layout
        
        return [table]
    }
}