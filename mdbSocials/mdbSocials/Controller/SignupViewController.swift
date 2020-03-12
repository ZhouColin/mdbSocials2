//
//  SignupViewController.swift
//  
//
//  Created by Maggie Yi on 2/28/20.
//
import UIKit
import Firebase
import Foundation

class SignupViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var fullnameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
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
    
    func handleSignup() {
        let fullname = fullnameTextField.text!
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let email = emailTextField.text!
        
        if password.count < 8 {
            self.displayAlert(title: "Error", message: "Password must be 8 characters or longer")
        }
        
        // init auth
        let auth = Auth.auth()
        // Create User
        auth.createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                self.displayAlert(title: "Error", message: "Check if textfields are valid")
                print(error.debugDescription)
                return
            }
            guard user != nil else {
                self.displayAlert(title: "Error", message: "User Error")
                return
            }
            
        // Enter new node into database
                // a. Database Reference
            let db = Database.database().reference()
                // b. Users Folder
            let usersNode = db.child("Users")
            
                // c. New Node Reference
            guard let newUserId = usersNode.childByAutoId().key else {
                return
            }
            let userNode = usersNode.child(newUserId)
            userNode.updateChildValues(["username": username, "name": fullname])
            
                // 3. Segue to Feed
            self.performSegue(withIdentifier: "signupToFeed", sender: self)
        }
        
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signupButton(_ sender: Any) {
        handleSignup()
    }
    
    
}
