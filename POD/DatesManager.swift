//
//  DatesManager.swift
//  POD
//
//  Created by Vojtech Rinik on 20/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation


// It manages all of my dates, get it?
class DatesManager {
    static func currentWeekDates() -> [NSDate] {
        let calendar = NSCalendar.currentCalendar()
        let date = NSDate()
        
        // TODO: User some proper way to find the last sunday... This is ridiculous.
        // But that's how code written on a plane is...
        let nextSunday = calendar.dateBySettingUnit(.Weekday, value: 1, ofDate: date, options: NSCalendarOptions(rawValue: 0))
        let lastSunday = nextSunday!.dateByAddingTimeInterval(-1*60*60*24*7)
        
        var days: [NSDate] = []
        for var i = 0; i < 7; i++ {
            let interval = Double(i*60*60*24)
            days.append(lastSunday.dateByAddingTimeInterval(interval))
        }
        
        return days
    }
    
    static func datesForMonth() -> [[AnyObject]] {
        return [["1", "2", "3", "4", "5", "6", "7"], ["1", "2", "3", "4", "5", "6", "7"]]
    }
}