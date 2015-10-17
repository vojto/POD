//
//  MainComponent.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation

class MainComponent: Component {
    override func render() -> [Component] {
        let upButton = Button(title: "Up")
        upButton.layout.width = 100
        upButton.layout.height = 20
        upButton.tag = "UpButton"
        
        upButton.layout.left <- layout.left + 20
        upButton.layout.top <- layout.top + 20
        upButton.layout.bottom <- layout.bottom - 20
        
        let downButton = Button(title: "Down")
        downButton.layout.width = 100
        downButton.layout.height = 20
        downButton.tag = "DownButton"
        
        downButton.layout.left <- upButton.layout.right + 20
        downButton.layout.top <- layout.top + 20
        downButton.layout.bottom <- layout.bottom - 20
        downButton.layout.right <- layout.right - 20
        
        return [upButton, downButton]
    }
}