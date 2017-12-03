//
//  SignInViewController.swift
//  RushApp
//
//  Created by Brian Li on 10/6/17.
//  Copyright © 2017 rush. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
import FirebaseDatabase

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        ref = Database.database().reference()
        
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        // ref = Database.database().reference()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        // ...
        if let error = error { return }
        
        let loginUserId = user.userID
        let loginGivenName = user.profile.givenName
        let loginFamilyName = user.profile.familyName
        let loginEmail = user.profile.email
        
        CurrentUserData.CurrentUser = User()
        CurrentUserData.CurrentUser.firstName = loginGivenName!
        CurrentUserData.CurrentUser.lastName = loginFamilyName!
        CurrentUserData.CurrentUser.userID = loginUserId!
        CurrentUserData.CurrentUser.email = loginEmail!
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            
            self.ref.child("allUsers").child("GID").child(loginUserId!).observe(DataEventType.value, with: { (snapshot) in
                if snapshot.exists() {
                    // firebase.google.com/docs/database/ios/read-and-write
                    print("user found")
                    let value = snapshot.value as? [String: AnyObject]
                    CurrentUserData.CurrentUser = User(dict: value!)
                } else {
                    // firebase.google.com/docs/database/ios/read-and-write
                    print("user not found")
                    
                    
                    // pull data on all school names and store
                    self.ref.child("schools").child("allSchools").observe(DataEventType.value, with: { (allSchoolsSnapshot) in
                        GlobalData.AllSchools = allSchoolsSnapshot.value as! [String]
                        dump(GlobalData.AllSchools)
                        self.performSegue(withIdentifier: "createNewUser", sender: nil)
                    })
                    
                }
                
            })
            
            
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
}

