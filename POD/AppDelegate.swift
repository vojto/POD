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
        let controller = Controller()
        controller.rootComponent = MainComponent()
        window.contentView = controller.view
    }

    func applicationWillTerminate(aNotification: NSNotification) {

    }
}


