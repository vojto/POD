//
//  TableItem.swift
//  POD
//
//  Created by Vojtech Rinik on 19/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class TableItem: Component {
    var item: AnyObject? = nil
    
    required init(item: AnyObject) {
        self.item = item
    }
    
    override func createView() -> NSView {
        return NSTableCellView()
    }
}