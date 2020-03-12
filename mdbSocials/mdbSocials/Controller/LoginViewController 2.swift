//
//  ViewController.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import Foundation

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        //get default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            return displayError("Login Error")
        }
        //set self as the delegate
        authUI?.delegate = self
        //get a reference to auth UI object VC
        let authViewController = authUI!.authViewController()
        //show
        present(authViewController, animated: true, completion: nil)
    }
    
    func displayError(_ message:String) {
            let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alertView, animated: true, completion: nil)
    }

    
}

extension LoginViewController: FUIAuthDelegate, authDataResult{
    
    let authDataResult =
    
    private func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: authDataResult?, error: Error?) {
        //check if error exists
        guard error == nil else {
            return
        }
        
        //check if user already exists
        authDataResult?.user.uid
        
        //bring to login page
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
