//
//  NewUserViewController.swift
//  RushApp
//
//  Created by Brian Jordan on 11/17/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {

    let requiredFields = ["School", "First Name", "Last Name"]
    var index = 0
    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay() {
        
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if(textField.text != nil) {
            
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
