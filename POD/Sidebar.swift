//
//  Sidebar.swift
//  POD
//
//  Created by Vojtech Rinik on 21/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Sidebar: Component {
    override func render() -> [Component]? {
        // Table
        let table = Table()
        let days = DatesManager.currentWeekDates()
        table.items = days.map { [$0] }
        table.itemComponent = SidebarItem.self
        
        // Calendar
        let calendar = Calendar()
        calendar.style.background = NSColor.redColor()
        
        // Layout
        table.intercellSpacing = NSSize(width: 2, height: 2)
        table.layout.top <- layout.top
        table.layout.left <- layout.left
        table.layout.right <- layout.right
        table.layout.bottom <- calendar.layout.top
        
        calendar.layout.bottom <- layout.bottom
        calendar.layout.left <- layout.left
        calendar.layout.right <- layout.right
        calendar.layout.height = 100
        

        return [table, calendar]
    }
}



