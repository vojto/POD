//
//  Controller.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import Cocoa

class Controller: NSViewController {
    var rootComponent: Component? {
        didSet {
            print("Controller - going to render")
            Renderer.render(rootComponent!, containerView: self.view)
            print("Controller - done rendering")
        }
    }
    
    override func loadView() {
        print("Controller - Loaded view")
        self.view = NSView(frame: NSZeroRect)
    }
    
    override func viewDidLoad() {
        print("Controller - view did load")
    }
    
    override func viewDidAppear() {
        print("Controller - view did appear - calling root component")
        rootComponent!.viewDidAppear()
        print("Controller - view did appear - done")
    }
}