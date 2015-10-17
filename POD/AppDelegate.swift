//
//  AppDelegate.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let main = MainComponent()
        Renderer.render(main, containerView: window.contentView!)
    }

    func applicationWillTerminate(aNotification: NSNotification) {

    }


}

