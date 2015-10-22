//
//  Calendar.swift
//  POD
//
//  Created by Vojtech Rinik on 22/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Calendar: Component {
    override func render() -> [Component]? {
        let table = Table()
        table.layout <- layout
        table.columnCount = 7
        
        table.items = DatesManager.datesForMonth()
        
        table.itemComponent = CalendarCell.self
        
        return [table]
    }
}

class CalendarCell: TableItem {
    override func render() -> [Component]? {
        let date = self.item as! NSDate
        let label = Label(label: date.format("d"))
        label.font = NSFont.systemFontOfSize(10)
        label.alignment = .Center
        label.layout <- layout
        
        if !date.isThisMonth() {
            label.color = NSColor.grayColor()
        }
        
        
        return [label]
    }
}