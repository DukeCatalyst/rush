//
//  NURusheeViewController.swift
//  RushApp
//
//  Created by Brian Li on 12/3/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class NURusheeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pickerView.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if CurrentUserData.CurrentUser.rushGroups.count == 0 {
            print("waz 0")
            return 0
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrentUserData.CurrentUser.rushGroups.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CurrentUserData.CurrentUser.rushGroups[row]
    }

}
