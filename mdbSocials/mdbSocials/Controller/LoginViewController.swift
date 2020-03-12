//
//  ViewController.swift
//  mdbSocials
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    public func assignbackground(){
            let background = UIImage(named: "background1.png")
            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    func handleLogin() {
        let email = usernameTextField.text!
        let password = passwordTextField.text!
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                self.displayAlert(title: "Error", message: "Username or Password Incorrrect")
                print(error.debugDescription)
                return
            }
            guard user != nil else {
                self.displayAlert(title: "Error", message: "User Error")
                return
            }
            self.performSegue(withIdentifier: "loginToFeed", sender: self)
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        handleLogin()
    }
    
}
