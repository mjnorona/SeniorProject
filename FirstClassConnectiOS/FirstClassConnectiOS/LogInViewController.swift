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
    
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        if {
            
        } else {
            let alertController = UIAlertController(title: "Error", message: "Wrong email or password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func unwindLogout(segue: UIStoryboardSegue){
        print("logged out")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

