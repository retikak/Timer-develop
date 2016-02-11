//
//  Alarm.swift
//  Timer
//
//  Created by Retika Kumar on 2/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Alarm: NSObject {
    static let notificationAlarm = "notificationAlarm"
    static let alarmCompleted = "alarmCompleted"
    private var localNotification: UILocalNotification?
    
    
    private(set) var alarmDate: NSDate?
    var isArmed: Bool {
        get {
            if alarmDate != nil {
                return true
            } else {
                return false
            }
        }
        
    }
    func arm(fireDate: NSDate) {
        // alarmDate set
        
        alarmDate = fireDate
        
        // Create local notification
        let notification = UILocalNotification()
        notification.alertBody = "alarm complete"
        notification.alertTitle = "Alarm is armed"
        notification.fireDate = alarmDate
        notification.category = Alarm.notificationAlarm
        
        // schedule localNotification
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        
    }
    func cancel() {
        if isArmed {
            alarmDate = nil
            if let  localNotification = localNotification {
                UIApplication.sharedApplication().cancelLocalNotification(localNotification)
            }
        }
    }
    
        static func alarmComplete() {
            NSNotificationCenter.defaultCenter().postNotificationName(Alarm.alarmCompleted, object: nil, userInfo: nil)
            
        }
        
        
    
    
}
