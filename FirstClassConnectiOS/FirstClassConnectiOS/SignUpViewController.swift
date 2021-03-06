//
//  SignUpViewController.swift
//  FirstClassConnectiOS
//
//  Created by MJ Norona on 11/19/17.
//  Copyright © 2017 MJ Norona. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    var signedIn = false
    var username = ""
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        addUser(sender)
        //self.performSegue(withIdentifier: "SignUpSegue", sender: sender)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            print("going Here")
            let tabBarController = segue.destination as! UITabBarController
            let navigationController = tabBarController.viewControllers?.first as! UINavigationController
            let homeViewController = navigationController.topViewController as! HomeViewController
            homeViewController.username = username
        }
    }
    

    func addUser(_ sender: UIButton) {
        UserModel.addUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!, completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    
                    print("add User into DB: ", jsonResult)
                   
                    //error in sign in
                    if jsonResult["message"] != nil {
                        print(jsonResult["message"]!)
                        let alertController = UIAlertController(title: "Error", message: jsonResult["message"] as! String, preferredStyle: .alert)
                        print("1")
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        print("2")
                        
                        DispatchQueue.main.async {
                            self.present(alertController, animated: true, completion: nil)
                        }
                        print("3")
                    } else { //successfuly signed 
                        print("signed in")
                        DispatchQueue.main.async {
                            self.username = jsonResult["username"] as! String
                            self.performSegue(withIdentifier: "SignUpSegue", sender: sender)
                        }
                    }
                   
                }
            } catch {
                
            }
            
        })
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
