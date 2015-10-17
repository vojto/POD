//
//  SplitView.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

func delay(delay:Double, closure:()->()) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, dispatch_get_main_queue(), closure)
}

class SplitView: Component, NSSplitViewDelegate {
    let subviews: [Component]
    var sizeRanges: [Int:[CGFloat]] = [:]
    
    init(subviews: [Component]) {
       self.subviews = subviews
    }
    
    override func createView() -> NSView {
        let view = NSSplitView()
        view.vertical = true
        view.dividerStyle = .Thin
        view.delegate = self
        
        for subview in subviews {
            view.addSubview(subview.build())
        }
        
        return view
    }
    
    func setSizeRange(viewIndex: Int, range: [CGFloat]) {
        sizeRanges[viewIndex] = range
    }
    
    func splitView(splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        
        if let range = sizeRanges[dividerIndex] {
            return range[0]
        } else {
            return 0
        }
    }
    
    func splitView(splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        if let range = sizeRanges[dividerIndex] {
            return range[1]
        } else {
            return 99999
        }
    }
    
    override func viewDidAppear() {
        // Not calling super because SplitView doesn't have any children
        // TODO: It actually _should_ have children
        
        (view as! NSSplitView).setPosition(150, ofDividerAtIndex: 0)
        
    }
}