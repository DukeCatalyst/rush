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
    var firebaseClient: FirebaseClient!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use Firebase library to configure APIs
        
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        ref = Database.database().reference()
        firebaseClient = FirebaseClient.init()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
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
    
    func loadingUI() {
        activityIndicator.startAnimating()
        signInButton.isHidden = true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        // ...
        if let error = error { return }
        
        self.loadingUI()
        
        let loginUserId = user.userID
        let loginGivenName = user.profile.givenName
        let loginFamilyName = user.profile.familyName
        let loginEmail = user.profile.email
        
        print(loginUserId)
        
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
                    let value = snapshot.value as? [String: AnyObject]
                    CurrentUserData.CurrentUser = User(dict: value!)
                    CurrentSchoolData.CurrentSchool = CurrentUserData.CurrentUser.school
                    
                    self.firebaseClient.getAllSchoolGroups() { (result, error) in
                        if result {
                        }
                    }
                    
                    self.performSegue(withIdentifier: "userFound", sender: nil)
                    
                } else {
                    // pull data on all school names and store
                    self.ref.child("schools").child("allSchools").observe(DataEventType.value, with: { (allSchoolsSnapshot) in
                        GlobalData.AllSchools = allSchoolsSnapshot.value as! [String]
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

