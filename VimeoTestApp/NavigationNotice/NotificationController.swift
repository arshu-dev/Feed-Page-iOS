//
//  NotificationController.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 06/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation
import UIKit

open class NotificationController {
    
    fileprivate static func notificationView(_ text:String, viewWidth:CGFloat) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width:viewWidth, height: 64))
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let label = UILabel(frame: view.bounds)
        label.frame.origin.x = 10
        label.frame.origin.y = 10
        label.frame.size.width -= label.frame.origin.x
        label.frame.size.height -= label.frame.origin.y
        
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.text = text
        label.numberOfLines = 2
        
        label.textColor = UIColor.init(red: 237/255, green: 28/255, blue: 36/255, alpha: 1)
        label.font = UIFont.init(name: "Avenir-Heavy", size:16)
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        
        return view
    }
    
    // For showing Notification in the status bar
    class func showNotification(_ parentView:UIView, notificationText:String) {
        let content = notificationView(notificationText, viewWidth: parentView.frame.size.width)
        content.frame.size.height = 64
        content.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        _ = NavigationNotice.onStatusBar(false).addContent(content).showOn(parentView).hide(4)
    }
}
