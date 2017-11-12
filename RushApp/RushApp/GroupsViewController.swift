//
//  GroupsViewController.swift
//  
//
//  Created by Simran Singh on 11/11/17.
//

import UIKit

class GroupsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Fake data for now
        let trialUser = User(userID: "test", firstName: "Brian", lastName: "Li", school: "Duke")
        CurrentSessionData.GroupMembers.append(trialUser)
        CurrentSessionData.CurrentUser = trialUser
        
        var moreFakeUsers = User(userID: "test", firstName: "Brian", lastName: "Jordan", school: "Duke")
        CurrentSessionData.GroupMembers.append(moreFakeUsers)
        moreFakeUsers = User(userID: "test", firstName: "Simran", lastName: "Singh", school: "Duke")
        CurrentSessionData.GroupMembers.append(moreFakeUsers)
        moreFakeUsers = User(userID: "test", firstName: "Nikki", lastName: "Hevizi", school: "Duke")
        CurrentSessionData.GroupMembers.append(moreFakeUsers)
        
        print(CurrentSessionData.GroupMembers)
        
        var button : UIButton
        let width :CGFloat = 100.0
        let height :CGFloat = 50.0
        let x :CGFloat = view.center.x-width/2
        var y :CGFloat = 0.0
        let rushGroups = CurrentSessionData.CurrentUser.rushGroups!
        let memberGroups = CurrentSessionData.CurrentUser.memberGroups!
        for group in rushGroups {
            button = UIButton(type: UIButtonType.system) as UIButton
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            button.backgroundColor = UIColor.green
            button.setTitle(group, for: UIControlState.normal)
            button.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            y = y + 50
        }
        for group in memberGroups {
            button = UIButton(type: UIButtonType.system) as UIButton
            // x, y, width, height
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            button.backgroundColor = UIColor.green
            button.setTitle(group, for: UIControlState.normal)
            button.addTarget(self, action:#selector(self.buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            y = y + 50
        }
    }
    
    @objc func buttonAction(sender:UIButton!)
    {
        print(sender.titleLabel!.text!)
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
