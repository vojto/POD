//
//  NSView+Extensions.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    func addConstraint(view: NSView, attribute: NSLayoutAttribute, toView: NSView?, toAttribute: NSLayoutAttribute, constant: CGFloat) {
        addConstraint(NSLayoutConstraint(item: view, attribute: attribute, relatedBy: .Equal, toItem: toView, attribute: toAttribute, multiplier: 1.0, constant: constant))
    }
    
}