//
//  Component.swift
//  POD
//
//  Created by Vojtech Rinik on 17/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Cocoa

struct Layout {
    var width: Int? = nil
    var height: Int? = nil
    
    let left = Edge(type: .Left)
    let right = Edge(type: .Right)
    let top = Edge(type: .Top)
    let bottom = Edge(type: .Bottom)
}

class Component: NSObject {
    // Layout is struct, so we need to use var in order to allow it to be changed
    var style = StyleProps()
    
    var children: [Component] = []
    var isBuilt = false
    var view: NSView?
    
    var layout = Layout()
    
    var tag: String?
    
    var constraints: [Constraint] = []
    
    override init() {
        super.init()
        
        // TODO: Find a nicer way to do this
        layout.left.component = self
        layout.right.component = self
        layout.top.component = self
        layout.bottom.component = self
    }
    
    func build() -> NSView {
        // If component is already built, returns its view
        if view != nil {
            return view!
        }
        
        // Create new view for this component
        view = self.createView()
        view!.translatesAutoresizingMaskIntoConstraints = false
        
        // Add size constraints
        addSizeConstraints()
        
        // Render all children components and append their views
        let children = render()
        
        for child in children {
            let childView = child.build()
            view!.addSubview(childView)
        }
        
        let constraints = children.map { $0.constraints }.reduce([], combine: +)
        addConstraints(constraints)
        
//        print("Adding \(constraints.count) constraints to the view")
        
        return view!
    }
    
    func addSizeConstraints() {
        let view = self.view!
        
        if let width = layout.width {
            view.addConstraint(view, attribute: .Width, toView: nil, toAttribute: .NotAnAttribute, constant: CGFloat(width))
        }
        
        if let height = layout.height {
            view.addConstraint(view, attribute: .Height, toView: nil, toAttribute: .NotAnAttribute, constant: CGFloat(height))
        }
    }
    
    func addConstraints(constraints: Array<Constraint>) {
        // Add custom constraints
        for constraint in constraints {
            // var attribute: NSLayoutAttribute?
            let fromEdge = constraint.fromEdge;
            let fromView = fromEdge.component!.view!
            let toEdge = constraint.toEdge!;
            let toView = toEdge.component!.view!
            
            view!.addConstraint(toView, attribute: toEdge.attribute, toView: fromView, toAttribute: fromEdge.attribute, constant: CGFloat(constraint.constant))
        }
    }
    
    // Returns view for this component. Subclass may override this
    // method to use different view.
    func createView() -> NSView {
        return StyledView()
    }
    
    func render() -> [Component] {
        return []
    }
    
    override var description: String {
        let descriptions = self.render().map { $0.description }
        
        let children = descriptions.joinWithSeparator(", ")
        
        return "\(self.tag)[\(children)]"
    }
    
    
    // Managing constraints
    
    func addConstraint(constraint: Constraint) {
        constraints.append(constraint)
    }
}