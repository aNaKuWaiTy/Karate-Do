//
//  SignVC.swift
//  Karate Do
//
//  Created by aNaKuWaiTy on 7/31/16.
//  Copyright © 2016 SaifHendal. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignVC: UIViewController {

    @IBOutlet weak var emailTextField: MaterialTextField!
    @IBOutlet weak var passwordTextField: MaterialTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldPlaceholderColor()
    }
    
    override func viewDidAppear(animated: Bool) {

        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            performSegueWithIdentifier("goToFeed", sender: nil)
        }
    }
    
    func textFieldPlaceholderColor() {
        // Change TextField placeholder text color
        let strEmail = NSAttributedString(string: "Your Email", attributes: [NSForegroundColorAttributeName:PLACEHOLDERTEXT_COLORS])
        emailTextField.attributedPlaceholder = strEmail
        let strPass = NSAttributedString(string: "Your Password", attributes: [NSForegroundColorAttributeName:PLACEHOLDERTEXT_COLORS])
        passwordTextField.attributedPlaceholder = strPass
    }

    @IBAction func facebookBtnTapped(sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) in
            if error != nil {
                print("KarateDo: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("KarateDo!!: Why?")
            } else {
                print("KarateDo: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(credential: FIRAuthCredential) {
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
            if error != nil {
                print("KarateDo!: Unable to authenticate with firebase - \(error)")
            } else {
                print("KarateDo!: Successfully authenticated with Firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                    self.completeSignIn(user.uid, userData: userData)
                }
                
            }
        })
    }
    
    @IBAction func signInTapped(sender: AnyObject) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("KarateDo: Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("KarateDo: Unable to authenticate with Firebase useing email")
                        } else {
                            print("KarateDo: Successfully authenticate with Firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        
        DataService.ds.createFirebaseDBUser(id, userData: userData)
        
        let keychainResult = KeychainWrapper.setString(id, forKey: KEY_UID)
        print("KarateDo: Data saved to keychain \(keychainResult)")
        performSegueWithIdentifier("goToFeed", sender: nil)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
