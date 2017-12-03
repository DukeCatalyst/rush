//
//  NUMemberViewController.swift
//  RushApp
//
//  Created by Brian Li on 12/3/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class NUMemberViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        pickerView.reloadAllComponents()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if CurrentUserData.CurrentUser.memberGroups.count == 0 {
            return 0
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrentUserData.CurrentUser.memberGroups.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CurrentUserData.CurrentUser.memberGroups[row]
    }

    
}
