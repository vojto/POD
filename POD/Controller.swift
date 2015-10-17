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
            print("Rendering root component into view: \(self.view)")
            Renderer.render(rootComponent!, containerView: self.view)
        }
    }
    
    override func loadView() {
        self.view = NSView(frame: NSZeroRect)
    }
    
    override func viewDidAppear() {
        rootComponent!.viewDidAppear()
    }
}