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

class SignVC: UIViewController {

    @IBOutlet weak var emailTextField: MaterialTextField!
    @IBOutlet weak var passwordTextField: MaterialTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change TextField placeholder text color
        let strEmail = NSAttributedString(string: "Your Email", attributes: [NSForegroundColorAttributeName:UIColor(red: 200.0 / 255.0, green: 200.0 / 255.0, blue: 200.0 / 255.0, alpha: 0.5)])
        emailTextField.attributedPlaceholder = strEmail
        
        let strPass = NSAttributedString(string: "Your Password", attributes: [NSForegroundColorAttributeName:UIColor(red: 200.0 / 255.0, green: 200.0 / 255.0, blue: 200.0 / 255.0, alpha: 0.5)])
        passwordTextField.attributedPlaceholder = strPass

        
    }

    @IBAction func facebookBtnTapped(sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) in
            if error != nil {
                print("Opps: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Cancelled!!: Why?")
            } else {
                print("Wellcom: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(credential: FIRAuthCredential) {
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
            if error != nil {
                print("Opps: Unable to authenticate with firebase - \(error)")
            } else {
                print("Yaa!: Successfully authenticated with Firebase")
            }
        })
    }
    
    @IBAction func signInTapped(sender: AnyObject) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("good: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("User: Unable to authenticate with Firebase useing email")
                        } else {
                            print("User: Successfully authenticate with Firebase")
                        }
                    })
                }
            })
        }
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
