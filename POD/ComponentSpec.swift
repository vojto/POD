//
//  ComponentSpec.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import XCTest
import POD
import Quick
import Nimble

class FooComponent: Component {
    override func render() -> [Component]? {
        return [BarComponent()]
    }
}

class BarComponent: Component {
}

class ComponentSpec: QuickSpec {
    override func spec() {
        describe("#init") {
            it("has empty renderedChildren upon initialization") {
                let component = Component()
                expect(component.children).toNot(beNil())
                expect(component.children).to(beEmpty())
            }
            
            it("loads children from render() upon initialization") {
                let component = FooComponent()
                expect(component.children!.count).to(equal(1))
                expect(component.children![0]).to(beAKindOf(BarComponent))
            }
        }
    }
}