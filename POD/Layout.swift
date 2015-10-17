//
//  Layout.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation

struct Layout {
    var width: Int? = nil
    var height: Int? = nil
    
    let left = Edge(type: .Left)
    let right = Edge(type: .Right)
    let top = Edge(type: .Top)
    let bottom = Edge(type: .Bottom)
}