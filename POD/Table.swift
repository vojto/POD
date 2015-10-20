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
    
    var numberOfRows: (() -> Int)?
    var componentAtRow: (() -> Component)?
    var itemComponent: TableItem.Type?
    var items: [AnyObject]?
    
    override func createView() -> NSView {
        let scrollView = NSScrollView.init()
        let tableView = NSTableView.init()
        
        let column1 = NSTableColumn.init(identifier: "column1")
        
        column1.width = 200

        tableView.addTableColumn(column1)
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
        if let fun = numberOfRows {
            return fun()
        } else if let items = self.items {
            return items.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let fun = componentAtRow {
            return fun().build()
        } else if let type = itemComponent {
            let component = type.init(item: items![row])
            return component.build()
        } else {
            return nil
        }
    }
    
    /*
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        return "ahoj"
    }
    */
}