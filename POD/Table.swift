//
//  TableComponent.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Table: Component, NSTableViewDelegate, NSTableViewDataSource {
    
    var itemComponent: TableItem.Type?
    var items: [[AnyObject]]?
    var columnCount = 1
    
    override func createView() -> NSView {
        let scrollView = NSScrollView.init()
        let tableView = NSTableView.init()
        
        for var i = 0; i < columnCount; i++ {
            let column = NSTableColumn(identifier: "column\(i)")
            column.width = 1
            column.resizingMask = .AutoresizingMask
            tableView.addTableColumn(column)
        }
        
        tableView.columnAutoresizingStyle = .UniformColumnAutoresizingStyle
        tableView.setDelegate(self)
        tableView.setDataSource(self)
        tableView.selectionHighlightStyle = .SourceList
        
        tableView.reloadData()
        tableView.headerView = nil
        
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true
        scrollView.borderType = .NoBorder
        
        return scrollView
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if let items = self.items {
            return items.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let columnIndex = tableView.tableColumns.indexOf(tableColumn!)!
        
        if let type = itemComponent {
            let component = type.init(item: items![row][columnIndex])
            return component.build()
        }
        
        return nil
    }
    
    /*
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        return "ahoj"
    }
    */
}