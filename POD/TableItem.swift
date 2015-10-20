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
    override func createView() -> NSView {
        return NSTableCellView()
    }
}