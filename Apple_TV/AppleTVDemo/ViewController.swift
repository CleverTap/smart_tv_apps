//
//  ViewController.swift
//  AppleTVDemo
//
//  Created by Aishwarya Nanna on 07/11/22.
//

import UIKit
import CleverTapSDK

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordEventAction(_ sender: UIButton) {
        CleverTap.sharedInstance()?.recordEvent("RecordButtonForTVOS_Pressed")
    }
    
    @IBAction func recordEventWithPropsAction(_ sender: UIButton) {
        let props = [
            "Product name": "Apple TV",
            "Category": "Digital",
            "Price": 167.00,
            "Date": NSDate()
        ] as [String : Any]

        CleverTap.sharedInstance()?.recordEvent("RecordWithPropsButtonForTVOS_Pressed", withProps: props)
    }
    
    @IBAction func onUserLoginAction(_ sender: UIButton) {
        let profile: Dictionary<String, Any> = [
            "Name": "Test User",
            "Email": "test.user@gmail.com",

            "Plan type": "Silver",
            "Favorite Food": "Pizza"
        ]
        CleverTap.sharedInstance()?.onUserLogin(profile)
    }

}

