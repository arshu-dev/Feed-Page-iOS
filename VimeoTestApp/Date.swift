//
//  Date.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 04/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation

extension Date {
    func timeAgoSinceDate(numericDates:Bool) -> String {
        let calendar = NSCalendar.current
        let now = NSDate()
        let earliest = now.earlierDate(self)
        let latest = (earliest == now as Date) ? self : now as Date
        let calendarComponents = Set<Calendar.Component>([.minute, .hour, .day, .weekOfYear, .month, .year, .second])
        let components:DateComponents = calendar.dateComponents(calendarComponents, from: self, to: latest as Date)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 5) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
        
    }
}
