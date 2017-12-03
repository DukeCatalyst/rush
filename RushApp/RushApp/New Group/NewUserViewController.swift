//
//  NewUserViewController.swift
//  RushApp
//
//  Created by Brian Li on 12/2/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if CurrentUserData.CurrentUser.firstName != "" {
            firstNameTextField.text = CurrentUserData.CurrentUser.firstName
        }
        
        if CurrentUserData.CurrentUser.lastName != "" {
            lastNameTextField.text = CurrentUserData.CurrentUser.lastName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        CurrentUserData.CurrentUser.firstName = firstNameTextField.text!
        CurrentUserData.CurrentUser.lastName = lastNameTextField.text!
    }
    

}
