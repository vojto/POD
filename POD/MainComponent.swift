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
        upButton.width = 100
        upButton.height = 20
        upButton.tag = "UpButton"
        
        upButton.left <- left + 20
        upButton.top <- top + 20
        upButton.bottom <- bottom - 20
        
        let downButton = Button(title: "Down")
        downButton.width = 100
        downButton.height = 20
        downButton.tag = "DownButton"
        
        downButton.left <- upButton.right + 20
        downButton.top <- top + 20
        downButton.bottom <- bottom - 20
        downButton.right <- right - 20
        
        return [upButton, downButton]
    }
}