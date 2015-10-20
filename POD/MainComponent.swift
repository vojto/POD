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
        let table = Table()
        
        table.layout <- layout
//        table.numberOfRows = numberOfRows
//        table.componentAtRow = componentAtRow
        
        let days = DatesManager.currentWeekDates()
        
        table.items = days
        
        table.itemComponent = SidebarItem.self
        
        return [table]
    }
}

class SidebarItem: TableItem {
    override func render() -> [Component]? {
        let date = item as! NSDate
        let text = date.format("E, MMM dd")
//        let isToday = (date.format("yyyy-MM-dd") == NSDate().format("yyyy-MM-dd")
        let isToday = date.isSameDayAs(NSDate())
        
        let label = Label(label: text)
        
        if isToday {
            label.isBold = true
        }
        
        label.layout <- layout
        
        return [label]
    }
}

