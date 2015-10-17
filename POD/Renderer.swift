//
//  Renderer.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

enum RendererError: ErrorType {
    case NotBuilt
}

class Renderer {
    static func render(component: Component, containerView: NSView) {
        let renderer = Renderer()
        renderer.render(component, containerView: containerView)
    }
    
    func render(component: Component, containerView: NSView) {
        let view = component.createViews()
        
        containerView.addSubview(view)
        
        let views = ["view": view]
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
}