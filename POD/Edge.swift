//
//  Edge.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

enum EdgeType {
    case Left;
    case Right;
    case Top;
    case Bottom;
}

class Edge {
    let type: EdgeType
    
    var attribute: NSLayoutAttribute {
        get {
            switch type {
            case .Left:
                return .Left;
            case .Right:
                return .Right;
            case .Top:
                return .Top;
            case .Bottom:
                return .Bottom;
            }
        }
    }
    
    var component: Component?
    
    init(type: EdgeType) {
        self.type = type
    }
}

infix operator <- {
associativity right
precedence 130
}

func <- (left: Edge, right: Edge) {
    let constraint = Constraint(toEdge: left, fromEdge: right, constant: 0)
    left.component!.addConstraint(constraint)
}

func <- (left: Edge, var right: Constraint) {
    right.toEdge = left
    left.component!.addConstraint(right)
}

func <- (layout1: Layout, layout2: Layout) {
    layout1.left <- layout2.left
    layout1.right <- layout2.right
    layout1.top <- layout2.top
    layout1.bottom <- layout2.bottom
}

func + (left: Edge, right: Int) -> Constraint {
    return Constraint(toEdge: nil, fromEdge: left, constant: right)
}

func - (left: Edge, right: Int) -> Constraint {
    return Constraint(toEdge: nil, fromEdge: left, constant: -right)
}