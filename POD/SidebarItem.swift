//
//  SidebarItem.swift
//  POD
//
//  Created by Vojtech Rinik on 21/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation

class SidebarItem: TableItem {
    override func render() -> [Component]? {
        let date = item as! NSDate
        let text = date.format("E, MMM dd")
        let isToday = date.isSameDayAs(NSDate())
        
        let label = Label(label: text)
        
        if isToday {
            label.isBold = true
        }
        
        label.layout <- layout
        
        return [label]
    }
}