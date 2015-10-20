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
        split.setSizeRange(0, range: [150, 300])
        
        split.layout <- layout
        
        return [split]
    }
}

class Sidebar: Component {
    override func render() -> [Component]? {
        let table = TableComponent()
        
        table.layout <- layout
        table.numberOfRows = numberOfRows
        table.componentAtRow = componentAtRow
        
        return [table]
    }
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func componentAtRow() -> Component {
        let comp = SidebarItem()
        return comp
    }
}

class SidebarItem: Component {
    override func render() -> [Component]? {
        let label = Label(label: "Hello")
        
        label.layout <- layout
        
        return [label]
    }
}

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