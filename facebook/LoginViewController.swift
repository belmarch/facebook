//
//  LoginViewController.swift
//  facebook
//
//  Created by Ron Belmarch on 9/9/14.
//  Copyright (c) 2014 Belmerica. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
           view.endEditing(true)
    }

//    @IBAction func onLoginButton(sender: AnyObject) {
//        loadingView.startAnimating()
//        loginButton.selected = true
        
        
//        delay(2, closure: { <#() -> ()##() -> ()#> in
            
//        self.loadingView.stopAnimating()
//        self.loginButton.selected = false
            
//            if (self.emailField.text == "tim" && self.passwordField.text =="password") {
//            }
//            {else {UIAlertView(title: "Oops", message: "Wrong email" deletgate: nil, cancelButtonTitle: "OK").show()
//                }
//                }
 //           }
 //       })
    
//    }

    
    func keyboardWillShow(notification: NSNotification!) {
        containerView.frame.origin.y=(12)

//containerView.frame.origin.x=containerView.frame.origin.x+100
    }
    
    func keyboardWillHide(notification: NSNotification!) {
    containerView.frame.origin.y=containerView.frame.origin.y+200
//        containerView.frame.origin.x=containerView.frame.origin.x-100
    }
    
    @IBAction func onEmailEditClicked(sender: AnyObject) {
        if (self.emailField.text == "" && self.passwordField.text == "") {
        }
    }
    
    
    @IBAction func onSignin(sender: AnyObject) {
        
        loginButton.selected = true


        
            self.loginButton.selected = false
            if self.emailField.text == "tim" && self.passwordField.text == "password" {
                spinner.startAnimating()
                delay(2, closure: { () -> () in
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                self.spinner.stopAnimating()
                })
                
    
            }
            else {
                spinner.startAnimating()
                 delay(2, closure: { () -> () in
                UIAlertView(title: "Oops", message: "Wrong email or password", delegate: nil, cancelButtonTitle: "OK").show()
                    self.spinner.stopAnimating()
                    })
            }
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
