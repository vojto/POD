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

public class Component: NSObject {
    // Layout is struct, so we need to use var in order to allow it to be changed
    var style = StyleProps()
    
    var isBuilt = false
    var renderedView: NSView?
    
    var view: NSView {
        get {
            return renderedView!
        }
    }
    
    public var children: [Component]?
    
    var layout = Layout()
    
    var tag: String?
    
    var constraints: [Constraint] = []
    
    override public init() {
        super.init()
        
        self.children = render()
        
        // TODO: Find a nicer way to do this
        layout.left.component = self
        layout.right.component = self
        layout.top.component = self
        layout.bottom.component = self
    }
    
    func build() -> NSView {
        // If component is already built, returns its view
        if renderedView != nil {
            return renderedView!
        }
        
        // Create new view for this component
        renderedView = self.createView()
        renderedView!.translatesAutoresizingMaskIntoConstraints = false
        
        // Add size constraints
        addSizeConstraints()
        
        for child in children! {
            let childView = child.build()
            renderedView!.addSubview(childView)
        }
        
        let constraints = children!.map { $0.constraints }.reduce([], combine: +)
        addConstraints(constraints)
        
//        print("Adding \(constraints.count) constraints to the view")
        
        return renderedView!
    }
    
    func addSizeConstraints() {
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
            let fromView = fromEdge.component!.view
            let toEdge = constraint.toEdge!;
            let toView = toEdge.component!.view
            
            view.addConstraint(toView, attribute: toEdge.attribute, toView: fromView, toAttribute: fromEdge.attribute, constant: CGFloat(constraint.constant))
        }
    }
    
    // Returns view for this component. Subclass may override this
    // method to use different view.
    func createView() -> NSView {
        let view = StyledView()
        
        if let background = style.background {
            view.background = background
        }
        
        return view
    }
    
    public func render() -> [Component]? {
        return []
    }
    
    // Managing constraints
    
    func addConstraint(constraint: Constraint) {
        constraints.append(constraint)
    }
    
    // Sends view did appear to the entire Component tree
    // PERF: This might be slowing us down in the future
    func viewDidAppear() {
        for child in children! {
            child.viewDidAppear()
        }        
    }
    
}








