//
//  AlarmViewController.swift
//  Timer
//
//  Created by Cameron Moss on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var alarmButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var messageLabel: UILabel!
    let alarm = Alarm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = NSDate()
        
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "alarmNotSet", name: Alarm.alarmCompleted, object: nil)
        guard let  scheduledNotifiactions = UIApplication.sharedApplication().scheduledLocalNotifications else {return}
        alarm.cancel()
        
        
        for notification in scheduledNotifiactions {
            if notification.category == Alarm.notificationAlarm
            {
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
                guard let fireDate = notification.fireDate else {return}
                alarm.arm(fireDate)
                alarmSet()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alarmSet() {
        messageLabel.text = "Alarm is set"
        alarmButton.setTitle("Cancel Alarm", forState: .Normal)
        datePicker.userInteractionEnabled = false
        let  dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .LongStyle
        
        if let date = alarm.alarmDate {
            dateLabel.text = dateFormatter.stringFromDate(date)
            datePicker.date = date
            
        } else {
            dateLabel.text = ""
            
            
        }
        
        
        
    }
    func alarmNotSet() {
        alarm.cancel()
        messageLabel.text = "Your alarm is not set"
        dateLabel.text = ""
        alarmButton.setTitle("Set alarm", forState: .Normal)
        datePicker.minimumDate = NSDate()
        datePicker.date = NSDate()
        datePicker.userInteractionEnabled = true
        
    }

    
    @IBAction func alarmButtonTapped(sender: AnyObject) {
        if alarm.isArmed {
            alarm.cancel()
            alarmNotSet()
            
        } else {
            alarm.arm(datePicker.date)
            
            alarmSet()
            
            
        }
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
