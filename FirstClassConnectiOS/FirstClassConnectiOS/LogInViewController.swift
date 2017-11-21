//
//  ViewController.swift
//  FirstClassConnectiOS
//
//  Created by MJ Norona on 11/16/17.
//  Copyright © 2017 MJ Norona. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username = ""
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        loginUser(sender)
//        print(emailTextField.text)
//        print(passwordTextField.text)
        
        
//        let alertController = UIAlertController(title: "Error", message: "Wrong email or password.", preferredStyle: .alert)
//
//        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(defaultAction)
//
//        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LogInSegue" {
            print("going Here")
            let tabBarController = segue.destination as! UITabBarController
            let navigationController = tabBarController.viewControllers?.first as! UINavigationController
            let homeViewController = navigationController.topViewController as! HomeViewController
            homeViewController.username = username
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loginUser(_ sender: UIButton) {
        UserModel.logInUser(email: emailTextField.text!, password: passwordTextField.text!, completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print("email: \(self.emailTextField.text!)")
                    print("password: \(self.passwordTextField.text!)")
                    if jsonResult["message"] != nil {
                        print(jsonResult["message"]!)
                        let alertController = UIAlertController(title: "Error", message: jsonResult["message"] as! String, preferredStyle: .alert)

                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        DispatchQueue.main.async {
                            self.present(alertController, animated: true, completion: nil)
                        }
                    } else { //successfuly signed
                        print("signed in")
                        DispatchQueue.main.async {
                            self.username = jsonResult["username"] as! String
                            self.performSegue(withIdentifier: "LogInSegue", sender: sender)
                        }
                    }
                }
            } catch {
                
            }
        })
    }
    
    @IBAction func unwindLogout(segue: UIStoryboardSegue){
        print("logged out")
    }
    
    @IBAction func unwindSignUp(segue: UIStoryboardSegue){
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

