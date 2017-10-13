//
//  ViewController.swift
//  RushApp
//
//  Created by Brian Li on 10/6/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load\n\n\n\n")
        // Do any additional setup after loading the view, typically from a nib.
        if FBSDKAccessToken.current() != nil {
            // User is logged in, do work such as go to next view controller.
            print("logged in")
            print(FBSDKAccessToken.current())
        } else {
            print("should enter")
            let loginButton = FBSDKLoginButton()
            
            // Optional: Place the button in the center of your view.
            loginButton.center = view.center
            loginButton.readPermissions = ["public_profile"]
            view.addSubview(loginButton as? UIView ?? UIView())
            
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

