//
//  SignInViewController.swift
//  RushApp
//
//  Created by Brian Li on 10/6/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

