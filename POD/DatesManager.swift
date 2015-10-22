//
//  DatesManager.swift
//  POD
//
//  Created by Vojtech Rinik on 20/10/15.
//  Copyright © 2015 Vojtech Rinik. All rights reserved.
//

import Foundation
import SwiftDate


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
        // Find the first day of month
        var date = NSDate().beginningOfMonth.dateAtWeekStart() - 1.week
        
        var weeks: [[AnyObject]] = []
        
        for var i = 0; i < 5; i++ {
            var week: [AnyObject] = []
            for var i = 0; i < 7; i++ {
                week.append(date)
                date = date + 1.day
            }
            weeks.append(week)
        }
        
        weeks.forEach {
            print("\($0)")
        }
        
        return weeks
    }
}