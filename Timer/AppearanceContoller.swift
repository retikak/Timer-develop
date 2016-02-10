//
//  AppearanceContoller.swift
//  Timer
//
//  Created by Retika Kumar on 2/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit
class AppearanceController {
    static func initializeAppearanceDefaults() {
        UIButton.appearance().tintColor = UIColor.firstColor()
        UILabel.appearance().tintColor = UIColor.secondColor()
        UIProgressView.appearance().tintColor = UIColor.thirdColor()
        UIPickerView.appearance().tintColor = UIColor.fifthColor()
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState: .Normal)
    }
}
