//
//  SchoolPickerViewController.swift
//  RushApp
//
//  Created by Brian Li on 11/29/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import FirebaseDatabase

class SchoolPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var schoolPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use Firebase library to configure APIs
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GlobalData.AllSchools.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return GlobalData.AllSchools[row]
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        // store the school name that was selected
        CurrentSchoolData.CurrentSchool = GlobalData.AllSchools[schoolPickerView.selectedRow(inComponent: 0)]
        CurrentUserData.CurrentUser.school = GlobalData.AllSchools[schoolPickerView.selectedRow(inComponent: 0)]
        // extract data about all groups associated with the school
        let firebaseClient = FirebaseClient.init()
        
        firebaseClient.getAllSchoolGroups() { (result, error) in
            if result {
                
            }
        }
    }
}

