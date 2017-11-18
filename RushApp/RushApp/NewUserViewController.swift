//
//  NewUserViewController.swift
//  RushApp
//
//  Created by Brian Jordan on 11/17/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {

    let requiredFields = ["User ID", "First Name", "Last Name", "School", "Groups (Member)", "Groups (Rushing)"]
    let dataUpdating = ["userID", "firstName", "lastName", "school", "memberGroups", "rushGroups"]
    var index = 0
    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay() {
        fieldLabel.text = requiredFields[index]
        textField = nil
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if let currentText = textField.text, !currentText.isEmpty {
            let updatingDataType = dataUpdating[index]
            CurrentUserData.CurrentUser.setValue(textField.text!, forKey: updatingDataType)
            
            index += 1
            updateDisplay()
        } else {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
