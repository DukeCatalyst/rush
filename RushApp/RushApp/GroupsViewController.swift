//
//  GroupsViewController.swift
//  
//
//  Created by Simran Singh on 11/11/17.
//

import UIKit

class GroupsViewController: UIViewController {

    var firebaseClient: FirebaseClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Fake data for now
        //let trialUser = User(userID: "test", firstName: "Brian", lastName: "Li", school: "Duke",  year: "String", techInterests: "String", contact: "String", otherInterests: "String", birthday: "String")
        //CurrentUserData.CurrentUser = trialUser
        //CurrentGroupData.GroupMembers.append(trialUser)
        
        //var moreFakeUsers = User(userID: "test", firstName: "Brian", lastName: "Jordan", school: "Duke",  year: "String", techInterests: "String", contact: "String", otherInterests: "String", birthday: "String")
        //CurrentGroupData.GroupMembers.append(moreFakeUsers)
        //moreFakeUsers = User(userID: "test", firstName: "Simran", lastName: "Singh", school: "Duke",  year: "String", techInterests: "String", contact: "String", otherInterests: "String", birthday: "String")
        //CurrentGroupData.GroupMembers.append(moreFakeUsers)
        //moreFakeUsers = User(userID: "test", firstName: "Nikki", lastName: "Hevizi", school: "Duke",  year: "String", techInterests: "String", contact: "String", otherInterests: "String", birthday: "String")
        //CurrentGroupData.GroupMembers.append(moreFakeUsers)
        
        firebaseClient = FirebaseClient.init()
        
        updateUI()
        
    }
    
    func updateUI() {
        var button : UIButton
        let rushGroups = CurrentUserData.CurrentUser.rushGroups!
        let memberGroups = CurrentUserData.CurrentUser.memberGroups!
        let width :CGFloat = 350
        let height :CGFloat = 50
        let x :CGFloat = view.center.x-width/2
        var y :CGFloat = view.center.y-height*CGFloat(rushGroups.count+memberGroups.count)
        var label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Rush Groups:"
        self.view.addSubview(label)
        y += height + 20
        for group in rushGroups {
            button = UIButton(type: UIButtonType.system) as UIButton
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            button.backgroundColor = UIColor(red: 23/255.0, green: 30/255.0, blue: 111/255.0, alpha: 0.6)
            button.layer.borderWidth = 0.8
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.setTitle(group, for: UIControlState.normal)
            button.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            y += height + 20
        }
        label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Member Groups:"
        self.view.addSubview(label)
        y += height + 20
        for group in memberGroups {
            button = UIButton(type: UIButtonType.system) as UIButton
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            button.backgroundColor = UIColor(red: 23/255.0, green: 30/255.0, blue: 111/255.0, alpha: 0.2)
            button.layer.borderWidth = 0.8
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.setTitle(group, for: UIControlState.normal)
            button.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            y += height + 20
        }
    }
    
    @objc func buttonAction(sender:UIButton!)
    {
        CurrentGroupData.CurrentGroup = sender.titleLabel!.text!
        firebaseClient.getAllCurrentGroupData() { (result, error) in
            if result {
                self.performSegue(withIdentifier: "selected-group", sender: self)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
