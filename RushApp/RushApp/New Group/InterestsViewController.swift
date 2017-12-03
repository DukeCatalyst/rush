//
//  InterestsViewController.swift
//  RushApp
//
//  Created by Brian Li on 12/3/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {

    @IBOutlet var academicInterestsTextField: UITextField!
    
    @IBOutlet var otherInterestsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextClicked(_ sender: Any) {
        CurrentUserData.CurrentUser.techInterests = academicInterestsTextField.text!
        CurrentUserData.CurrentUser.otherInterests = otherInterestsTextField.text!
    }
    

}
