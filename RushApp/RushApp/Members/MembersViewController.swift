//
//  MembersViewController.swift
//  RushApp
//
//  Created by Simran Singh on 11/29/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var techInterests: UILabel!
    @IBOutlet weak var otherInterests: UILabel!
    @IBOutlet weak var contact: UILabel!
    
    var myUser: User = CurrentGroupData.SelectedMember
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "test.jpg")
        name.text = myUser.firstName + " " + myUser.lastName
        birthday.text = myUser.birthday
        year.text = "\(myUser.year)"
        techInterests.text = myUser.techInterests
        otherInterests.text = myUser.otherInterests
        contact.text = myUser.contact
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
