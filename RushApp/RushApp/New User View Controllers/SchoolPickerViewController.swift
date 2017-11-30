//
//  SchoolPickerViewController.swift
//  RushApp
//
//  Created by Brian Li on 11/29/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class SchoolPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var schoolPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        CurrentSchoolData.CurrentSchool = GlobalData.AllSchools[schoolPickerView.selectedRow(inComponent: 0)]
        
    }
}
