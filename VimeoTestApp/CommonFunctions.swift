//
//  CommonFunctions.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 06/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation

open class CommonFunctions {
    
    // MARK: For changing the extension from webp to jpg
    class func changeURLExtension (oldURL : String) -> (String) {
        return "\(String(describing: NSURL(string: oldURL)!.deletingPathExtension!)).jpg"
    }
    
    
    // MARK: For converting duration to Hours, Minutes & Secs
    class func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
        if ((seconds / 3600) > 0) { // For Hours
            if ((seconds % 3600) % 60 < 10) {
                return "\(seconds / 3600):\((seconds % 3600) / 60):0\((seconds % 3600) % 60)"
            } else {
                return "\(seconds / 3600):\((seconds % 3600) / 60):\((seconds % 3600) % 60)"
            }
        } else { // For Minutes & Seconds
            if ((seconds % 3600) % 60 < 10) {
                return "\((seconds % 3600) / 60):0\((seconds % 3600) % 60)"
            } else {
                return "\((seconds % 3600) / 60):\((seconds % 3600) % 60)"
            }
        }
    }
    
    
    // MARK: For converting Date & Time in time since ago format
    class func dateTimeToAgo (dateTime : String) -> (String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFromString = formatter.date(from: dateTime)
        
        let timeAgo = dateFromString?.timeAgoSinceDate(numericDates: true)
        print ("timeAgo = \(timeAgo!)")
        return timeAgo!
    }
}
