//
//  NSDate+Extensions.swift
//  POD
//
//  Created by Vojtech Rinik on 20/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation

extension NSDate {
    func format(format: String) -> String {
        // TODO: Creating a formatter each time we want to format a date may not perform very well
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    func isSameDayAs(date: NSDate) -> Bool {
        // TODO: Compare using Components
        let format = "yyyy-MM-dd"
        return self.format(format) == date.format(format)
    }
}